pageextension 50111 "ExtEmployee" extends "Employee Card"
{
    layout
    {
        addafter("Company E-Mail")
        {
            field("Führerschein"; Rec."Führerschein")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}