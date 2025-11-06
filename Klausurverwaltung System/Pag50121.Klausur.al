page 50121 Klausur
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Klausur;

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {


                field("Modul Name"; rec."Modul")
                {
                    ApplicationArea = All;

                }

                field("Modul Nummer"; rec."ModulNummer")
                {
                    ApplicationArea = All;

                }

                field(Semester; rec."Semester")
                {
                    ApplicationArea = All;

                }

                field(Prüfer; rec."Prüfer")
                {


                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action("Klausurergebnisse Exportieren")
            {
                ApplicationArea = All;
                Caption = 'Export als XML';
                trigger OnAction()
                var

                begin
                    Xmlport.Run(50125, false, false);
                end;
            }
        }

    }


    var
        myInt: Integer;
}
