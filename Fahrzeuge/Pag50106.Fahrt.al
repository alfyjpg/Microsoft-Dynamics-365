page 50106 Fahrt
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrt;

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                field(Fahrer; rec.Fahrer)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Get(Rec.Fahrer);
                        Rec."Führerschein" := Employee."Führerschein";
                    end;

                }

                field(Nummer; Rec.Nummer)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Fahrzeug; Rec.Fahrzeug)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        KFZ: Record Fahrzeug;
                    begin
                        KFZ.Get(Rec.Fahrzeug);
                        KFZ.CalcFields(Kilometerstand);
                        Rec."KMH FahrtBeginn" := KFZ.Kilometerstand;

                    end;
                }
                field(Fahrtbeginn; Rec.Fahrtbeginn)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        FahrtenKFZ: Record Fahrt;
                    begin
                        FahrtenKFZ.SetRange(Fahrzeug, Rec.Fahrzeug);
                        if FahrtenKFZ.Find('-') then
                            repeat
                                if rec.Fahrtbeginn = FahrtenKFZ.Fahrtbeginn then
                                    Error('Die Fahrt wurde schon erfasst!');

                            until FahrtenKFZ.Next() = 0;
                    end;

                }
                field(Fahrtende; Rec.Fahrtende)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;

                    begin
                        if Rec.Fahrtbeginn > rec.Fahrtende then
                            error('Das Fahrtende liegt vor dem Fahrtbeginn!');
                    end;
                }
                field("Zweck der Fahrt"; Rec."Zweck der Fahrt")
                {
                    ApplicationArea = All;
                }

                field("KMH FahrtBeginn"; Rec."KMH FahrtBeginn")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("KMH FahrtEnde"; Rec."KMH FahrtEnde")
                {
                    ApplicationArea = All;
                    trigger OnValidate()

                    begin
                        if Rec."KMH FahrtEnde" > Rec."KMH FahrtBeginn" then
                            Rec."Gefahrene KMH" := Rec."KMH FahrtEnde" - Rec."KMH FahrtBeginn"
                        else
                            Error('Ungültige Eingabe');


                    end;



                }
                field("Gefahrene KMH"; Rec."Gefahrene KMH")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Exportieren Als XML")
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = new;

                trigger OnAction()
                begin
                    Xmlport.Run(50111, false, false);
                end;
            }

            action("Fahrten importieren")
            {
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = new;

                trigger OnAction()
                begin
                    Xmlport.Run(50113, false, true);
                end;
            }
        }

    }

    var
        myInt: Integer;
}