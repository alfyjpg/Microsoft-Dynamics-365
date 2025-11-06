page 50123 "Klausur Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Klausur;
    Editable = false;
    SourceTableView = sorting("modulnummer") order(ascending);

    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {
                field("Modul"; rec."Modul")
                {
                    ApplicationArea = All;

                }

                field("Modulnummer"; rec.Modulnummer)
                {
                    ApplicationArea = All;

                }

                field("Semester"; rec.Semester)
                {
                    ApplicationArea = All;

                }
                field("Prüfer"; rec."Prüfer")
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
                RunObject = page Klausur;
                RunPageLink = Modulnummer = field(Modulnummer);
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