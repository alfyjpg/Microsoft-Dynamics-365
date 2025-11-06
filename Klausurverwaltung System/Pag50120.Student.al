page 50120 Student
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Student;


    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                field(Name; Rec."Name")
                {
                    ApplicationArea = All;

                }


                field(Matrikelnummer; Rec."Matrikelnummer")
                {
                    ApplicationArea = All;

                }

                field("Semester"; rec.Semester)
                {
                    ApplicationArea = All;

                }



                field("FH E-Mail"; Rec."FH E-Mail")
                {
                    ApplicationArea = All;

                }

                field(Adresse; Rec."Adresse")
                {
                    ApplicationArea = All;

                }
                field(Handynummer; rec."Handynummer")
                {
                    ApplicationArea = All;

                }


            }
        }
    }

    actions
    {
        area(Processing)
        {


            action("Notendurchschnitt berechnen")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    nds: Decimal;


                begin

                    nds := "nds-methode".NotenBerechnen(rec.Matrikelnummer);

                    if (nds > 0) then
                        Message('Notendurchscnitt für %1 beträgt %2', rec.Name, Format(nds, 0, 1))

                    else
                        Message('%1 hat soweit keine Klausuren Bestanden', rec.Name);

                end;
            }
        }
    }

    var
        "nds-methode": Codeunit Notendurchschnitt;

}