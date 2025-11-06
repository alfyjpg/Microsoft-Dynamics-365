page 50122 Ergebnis
{

    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Ergebnis;



    layout
    {
        area(Content)
        {
            group(Allgemein)
            {


                // field(Modulname; Rec.Modulname)
                // {
                //     ApplicationArea = All;
                // }

                field(Modul; Rec.Modulnummer)
                {

                    ApplicationArea = All;


                }
                field(Semester; Rec.Semester)
                {


                }


                // field(Studentenname; Rec.Studentenname)
                // {


                // }

                field(Student; Rec.Studentenmatrikelnummer)
                {


                }

                field(Note; Rec.Note)
                {


                }



                field(Versuch; rec.Versuch)
                {
                    Editable = false;

                }



            }
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


}
