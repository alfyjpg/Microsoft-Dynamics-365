codeunit 50124 validation
{
    trigger OnRun()
    begin

    end;

    var
        StudentRec: Record Student;
        ErgebnisRec: Record Ergebnis;


    procedure BestandenValidation(MatrikelNumber: Integer; PrüfungsNummer: Integer)
    var
        myInt: Integer;
    begin

        ErgebnisRec.SetRange(Modulnummer, PrüfungsNummer);
        ErgebnisRec.SetFilter(Studentenmatrikelnummer, '%1', MatrikelNumber);

        if ErgebnisRec.Find('-') then
            repeat
                IF (ErgebnisRec.Note < 5.0) and (ErgebnisRec.Note > 0.0) THEN begin
                    Error('Der Studierende hat schon mit %2 bestanden', ErgebnisRec.Studentenname, ErgebnisRec.Note);
                end
            UNTIL ErgebnisRec.NEXT = 0;


    end;

    procedure GreenLight(MatrikelNumber: Integer; PrüfungsNummer: Integer): Boolean
    var
        zähler: Integer;
    begin
        "zähler" := 0;
        ErgebnisRec.SetRange(Modulnummer, PrüfungsNummer);
        ErgebnisRec.SetFilter(Studentenmatrikelnummer, '%1', MatrikelNumber);
        if ErgebnisRec.Find('-') then begin
            repeat
                zähler := zähler + 1;
            UNTIL ErgebnisRec.NEXT = 0;
        end;
        if (zähler > 3) then
            exit(false)

        else
            exit(true)
    end;


    procedure VersuchZähler(MatrikelNumber: Integer; PrüfungsNummer: Integer): Integer
    var
        zähler: Integer;
    begin
        zähler := 1;
        ErgebnisRec.SetRange(Modulnummer, PrüfungsNummer);
        ErgebnisRec.SetFilter(Studentenmatrikelnummer, '%1', MatrikelNumber);
        if ErgebnisRec.Find('-') then begin
            repeat
                zähler := zähler + 1;
            UNTIL ErgebnisRec.NEXT = 0;
        end;
        exit(zähler);
    end;


    procedure RichtigeNote(Note: Decimal): Boolean
    var
        ValideNote: array[11] of Decimal;
        i: Integer;
        checked: Boolean;

    begin

        // checked := false;
        ValideNote[1] := 1.0;
        ValideNote[2] := 1.3;
        ValideNote[3] := 1.7;
        ValideNote[4] := 2.0;
        ValideNote[5] := 2.3;
        ValideNote[6] := 2.7;
        ValideNote[7] := 3.0;
        ValideNote[8] := 3.3;
        ValideNote[9] := 3.7;
        ValideNote[10] := 4.0;
        ValideNote[11] := 5.0;

        for i := 1 to ArrayLen(ValideNote) do begin
            if (note = ValideNote[i]) then begin
                exit(true);
                // checked := true;
                break
            end;
        end;



        exit(false)
        // if not checked then
        //     Error('Invalide Note');



    end;



 procedure MatrikelNummerValidation(MatrikelNumber: Integer)
var
    myInt: Integer;
begin
    
    StudentRec.SetRange(Matrikelnummer, MatrikelNumber);
    StudentRec.SetFilter(Matrikelnummer, '%1', MatrikelNumber);

    if StudentRec.Find('-') then begin
        Error('Diese Matrikelnummer ist anderem Student zugeordnet');
    end;

end;
}