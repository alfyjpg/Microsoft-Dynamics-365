report 50115 Fahrerliste
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';


    dataset
    {
        dataitem(Mitarbeiterdaten; Employee)
        {
            column(Number; "No.")
            {

            }
            column(First_Name; "First Name")
            {

            }
            column(Last_Name; "Last Name")
            {

            }
            column(Jo_Title; "Job Title")
            {

            }
            column(Mobile_Phone_No_; "Mobile Phone No.")
            {

            }
            column("Führerschein"; "Führerschein")
            {

            }

        }
    }

    // requestpage
    // {
    //     AboutTitle = 'Teaching tip title';
    //     AboutText = 'Teaching tip content';
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(LayoutName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    // var
    //     myInt: Integer;
}