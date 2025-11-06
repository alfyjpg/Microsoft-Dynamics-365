page 50108 "Fahrt Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;
    SourceTableView = sorting(Fahrtbeginn) order(ascending);

    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {
                field(Fahrer; Rec.Fahrer)
                {
                    ApplicationArea = All;

                }

                field(Nummer; Rec.Nummer)
                {
                    ApplicationArea = All;
                }

                field(Fahrzeug; Rec.Fahrzeug)
                {
                    ApplicationArea = All;
                }
                field(Fahrtbeginn; Rec.Fahrtbeginn)
                {
                    ApplicationArea = All;
                }
                field(Fahrtende; Rec.Fahrtende)
                {
                    ApplicationArea = All;
                }
                field("Zweck der Fahrt"; Rec."Zweck der Fahrt")
                {
                    ApplicationArea = All;
                }
                field("Gefahrene KMH"; Rec."Gefahrene KMH")
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
                RunObject = Page "Fahrt";
                RunPageLink = Nummer = field(Nummer);
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