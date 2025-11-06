xmlport 50111 ExportFahrt
{
    Format = xml;
    Direction = Export;

    schema
    {
        textelement(Fahrten)
        {
            tableelement(Fahrt; Fahrt)
            {
                fieldelement(Fahrer; Fahrt.Fahrer)
                {

                }
                fieldelement(Fahrzeug; Fahrt.Fahrzeug)
                {

                }
                fieldelement(Fahrtbeginn; Fahrt.Fahrtbeginn)
                {

                }
                fieldelement(Fahrtende; Fahrt.Fahrtende)
                {

                }
                fieldelement(ZweckDerFahrt; Fahrt."Zweck der Fahrt")
                {

                }
                fieldelement("KMFahrtbeginn"; Fahrt."KMH FahrtBeginn")
                {

                }
                fieldelement("KMFahrtende"; Fahrt."KMH FahrtEnde")
                {

                }
                fieldelement("GefahreneKM"; Fahrt."Gefahrene KMH")
                {

                }

            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {

    //             }
    //         }
    //     }
    // }

    var
        myInt: Integer;
}