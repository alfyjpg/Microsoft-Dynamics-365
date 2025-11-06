page 50110 "Fahrt Liste Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {

                field(Fahrtbeginn; Rec.Fahrtbeginn)
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
        // area(Factboxes)
        // {

        // }
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
}