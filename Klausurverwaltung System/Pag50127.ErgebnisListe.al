page 50127 "Ergebnis Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Ergebnis;
    Editable = false;
    SourceTableView = sorting("Modulnummer") order(ascending);


    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {


                field(Studentenname; rec.Studentenname)
                {
                        

                    ApplicationArea = All;


                }

                field(Modulname; Rec.Modulname)
                {
                    ApplicationArea = All;



                }



                field(Modulnummer; rec.Modulnummer)
                {
                    ApplicationArea = All;

                }
                field(Semester; Rec.Semester)
                {


                }


                field("Studenten Matrikelnummer"; rec."Studentenmatrikelnummer")
                {
                    ApplicationArea = All;

                }

                field(Note; rec."Note")
                {
                    ApplicationArea = All;

                }


                field(Versuch; Rec.Versuch)
                {


                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var

        ErgebnisRec: Record Ergebnis;
}