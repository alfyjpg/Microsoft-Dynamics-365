page 50109 "Abschreibungs Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Abschreibung;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Allgemein)
            {
                field(Fahrzeug; rec.Fahrzeug)
                {
                    ApplicationArea = All;

                }
                field(Jahr; Rec.Jahr)
                {
                    ApplicationArea = All;
                }

                field(Abschreibungssatz; Rec.Abschreibungssatz)
                {

                    ApplicationArea = All;
                }
                field(Abschreibungsbetrag; Rec.Abschreibungsbetrag)
                {
                    ApplicationArea = All;
                }
                field(Restbuchwert; Rec.Restbuchwert)
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