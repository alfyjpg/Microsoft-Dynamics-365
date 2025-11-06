report 50116 Fahrtenliste
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLFahrtenliste.rdl';


    dataset
    {
        dataitem(Fahrzeugdaten; Fahrzeug)
        {
            column(Kennzeichen; Kennzeichen)
            {

            }
            column(Typ; Typ)
            {

            }
            column(Hersteller; Hersteller)
            {

            }
            column(Modell; Modell)
            {

            }
            column(Kaufpreis; Kaufpreis)
            {

            }
            column(Kraftstoff; Kraftstoff)
            {

            }
            column(Kilometerstand; Kilometerstand)
            {

            }
            column("Anhängerkupplung"; "Anhängerkupplung")
            {

            }
            column(Kaufdatum; Kaufdatum)
            {

            }
            column(Restbuchwert; Restbuchwert)
            {

            }

            dataitem(Fahrt; Fahrt)

            {
                DataItemLinkReference = Fahrzeugdaten;
                DataItemLink = Fahrzeug = field(Kennzeichen);



                column(Fahrer; Fahrer)
                {

                }
                column(Nummer; Nummer)
                {

                }
                column(KFZ; Fahrzeug)
                {

                }
                column(Fahrtbeginn; Fahrtbeginn)
                {

                }
                column(Fahrtende; Fahrtende)
                {

                }
                column(Zweck_der_Fahrt; "Zweck der Fahrt")
                {

                }
                column(KM_Fahrtbeginn; "KMH FahrtBeginn")
                {

                }
                column(KM_Fahrtende; "KMH Fahrtende")
                {

                }
                column(Gefahrene_KMH; "Gefahrene KMH")
                {

                }
                column("Führerschein"; "Führerschein")
                {

                }

                dataitem(Employeedaten; Employee)
                {
                    DataItemLinkReference = Fahrt;
                    DataItemLink = "No." = field(Fahrer);

                    column(First_Name; "First Name")
                    {

                    }
                    column(Last_Name; "Last Name")
                    {

                    }
                }

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