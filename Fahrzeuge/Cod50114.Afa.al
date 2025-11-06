codeunit 50114 Afa
{
    trigger OnRun()
    begin

    end;

    var
        KFZ: Record Fahrzeug;
        Nutzungsdauer: Integer;
        Kaufjahr: Integer;
        "Aktuelles jahr": Integer;
        Jahr: Integer;


    procedure Initialisierung(Kennzeichen: Code[20])
    var
        myInt: Integer;
    begin
        KFZ.Get(Kennzeichen);
        case KFZ.Typ of
            KFZ.Typ::Kombi:
                Nutzungsdauer := 6;
            KFZ.Typ::Transporter:
                Nutzungsdauer := 6;
            KFZ.Typ::LKW:
                Nutzungsdauer := 9;
        end;
        "Aktuelles jahr" := Date2DMY(WorkDate, 3);
        Kaufjahr := Date2DMY(KFZ.Kaufdatum, 3);
        Jahr := Kaufjahr;
    end;

    procedure Linear(Kennzeichen: Code[20])
    var
        myInt: Integer;

        Abschreibung: Decimal;
        Abschreibungssatz: Decimal;
        Restbuchwert: Decimal;
    begin

        Initialisierung(Kennzeichen);
        Restbuchwert := KFZ.Kaufpreis;
        Abschreibung := KFZ.Kaufpreis / Nutzungsdauer;
        Abschreibungssatz := 100 / Nutzungsdauer;
        while (Jahr < "Aktuelles jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) do begin

            Restbuchwert := Restbuchwert - Abschreibung;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;

        end;

    end;

    procedure Degressiv(Kennzeichen: Code[20])
    var
        myInt: Integer;
        Abschreibung: Decimal;
        Abschreibungssatz: Decimal;
        Restbuchwert: Decimal;
    begin

        Initialisierung(Kennzeichen);

        // Setzen des Restbuchwertes auf den Kaufpreis des Fahrzeugs
        Restbuchwert := KFZ.Kaufpreis;

        // Festlegen des Abschreibungssatzes auf 25%
        Abschreibungssatz := 0.25;

        // Beginn der Abschreibung

        while (Jahr < "Aktuelles Jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) do begin

            Abschreibung := Restbuchwert * Abschreibungssatz;
            Restbuchwert := Restbuchwert - Abschreibung;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);

            // Erhöhen des Jahres um 1
            Jahr := Jahr + 1;
        end;


    end;


    procedure Kombiniert(Kennzeichen: Code[20])
    var
        myInt: Integer;

        Abschreibung: Decimal;
        Restnutzungsdauer: Integer;
        Einmal: Integer;
        Restbuchwert: Decimal;
        Abschreibunngssatz: Decimal;
    begin

        Initialisierung(Kennzeichen);
        Restbuchwert := KFZ.Kaufpreis;
        Einmal := 0;

        while (Jahr < "Aktuelles jahr") AND (Jahr < (Kaufjahr + Nutzungsdauer)) do begin
            Restnutzungsdauer := (Kaufjahr + Nutzungsdauer) - Jahr;
            if (Restbuchwert * 0.25) > (Restbuchwert / Restnutzungsdauer) then begin
                Abschreibunngssatz := 25;
                Abschreibung := Restbuchwert * Abschreibunngssatz / 100;
                Restbuchwert := Restbuchwert - Abschreibung;
            end else begin

                if Einmal = 0 then begin
                    Abschreibung := Restbuchwert / Restnutzungsdauer;
                    Einmal := 1;
                end;

                Abschreibunngssatz := 100 / Restbuchwert * Abschreibung;
                Restbuchwert := Restbuchwert - Abschreibung;
            end;

            Speicherung(Kennzeichen, Jahr, Abschreibunngssatz, Abschreibung, Restbuchwert);
            Jahr := Jahr + 1;
        end;

    end;

    procedure Leistungsabhängig(Kennzeichen: Code[20])
    var
        myInt: Integer;

        Restbuchwert: Decimal;
        KMGesamt: Decimal;
        FahrtenKFZ: Record Fahrt;
        FahrtbeginnDatum: Date;
        FahrtbeginnJahr: Integer;
        KMproJahr: array[3000] of Decimal;
        Abschreibungssatz: Decimal;
        Abschreibung: Decimal;
    begin
        Initialisierung(Kennzeichen);
        case KFZ.Typ of
            KFZ.Typ::Transporter:
                KMGesamt := 10000;
            else
                Error('Methode ist nur für fahrzeugtyp Transporter zulässig!')
        end;


        Restbuchwert := KFZ.Kaufpreis;
        FahrtenKFZ.SetRange(Fahrzeug, Kennzeichen);
        if FahrtenKFZ.Find('-') then
            repeat
                FahrtbeginnDatum := DT2Date((FahrtenKFZ.Fahrtbeginn));
                FahrtbeginnJahr := Date2DMY(FahrtbeginnDatum, 3);
                if (FahrtbeginnJahr < "Aktuelles jahr") AND (FahrtbeginnJahr < (Kaufjahr + Nutzungsdauer)) then
                    for jahr := Kaufjahr to ("Aktuelles jahr" - 1) do
                        if Jahr = FahrtbeginnJahr then
                            KMproJahr[Jahr] := KMproJahr[Jahr]
                         + FahrtenKFZ."Gefahrene KMH";

            until FahrtenKFZ.Next() = 0;

        Jahr := Kaufjahr;
        while (jahr < "Aktuelles jahr") AND (Jahr < Kaufjahr + Nutzungsdauer) do begin
            Abschreibungssatz := KMproJahr[Jahr] / KMGesamt * 100;
            Abschreibung := KFZ.Kaufpreis * Abschreibungssatz / 100;
            Restbuchwert := Restbuchwert - Abschreibung;
            Speicherung(Kennzeichen, Jahr, Abschreibungssatz, Abschreibung, Restbuchwert);
            jahr := jahr + 1;
        end;

    end;

    procedure Speicherung(
    Kennzeichen: Code[20];
    Jahr: Integer;
    Abschreibungssatz: Decimal;
    Abschreibungsbetrag: Decimal;
    Restbuchwert: Decimal)
    var
        Abschreibungen: Record Abschreibung;
    begin
        begin
            if Abschreibungen.Get(Kennzeichen, Jahr) then begin
                Abschreibungen.Abschreibungssatz := Abschreibungssatz;
                Abschreibungen.Abschreibungssatz := Abschreibungsbetrag;
                Abschreibungen.Restbuchwert := Restbuchwert;
                Abschreibungen.Modify;

            end else begin

                Abschreibungen.Fahrzeug := Kennzeichen;
                Abschreibungen.Jahr := Jahr;
                Abschreibungen.Abschreibungssatz := Abschreibungssatz;
                Abschreibungen.Abschreibungsbetrag := Abschreibungsbetrag;
                Abschreibungen.Restbuchwert := Restbuchwert;
                Abschreibungen.Insert;
            end;

        end;

    end;


}
