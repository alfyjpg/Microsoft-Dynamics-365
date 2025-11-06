page 50130 "Studierende Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    Editable = false;
    SourceTableView = sorting(Matrikelnummer) order(ascending);

    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }

                field(Matrikelnummer; rec.Matrikelnummer)
                {
                    ApplicationArea = All;
                }

                field(Semester; rec.Semester)
                {
                    ApplicationArea = All;
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
            action(Karte)
            {
                ApplicationArea = All;
                RunObject = page Student;
                RunPageLink = Matrikelnummer = field(Matrikelnummer);
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AnalysisView;
                trigger OnAction()
                begin

                end;
            }
        }
    }
}