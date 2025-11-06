xmlport 50112 ImportFahrzeug
{

    Format = xml;
    Direction = Import;

    schema
    {
        textelement(Fahrzeuge)
        {
            tableelement(Fahrzeug; Fahrzeug)
            {
                fieldelement(Kennzeichen; Fahrzeug.Kennzeichen)
                {

                }
                fieldelement(Typ; Fahrzeug.Typ)
                {

                }
                fieldelement(Hersteller; Fahrzeug.Hersteller)
                {

                }

                fieldelement(Modell; Fahrzeug.Modell)
                {

                }
                fieldelement(Kaufpreis; Fahrzeug.Kaufpreis)
                {

                }
                fieldelement(Kraftstoff; Fahrzeug.Kraftstoff)
                {

                }

                fieldelement(Anhängerkupplung; Fahrzeug.Anhängerkupplung)
                {

                }
                fieldelement(Kaufdatum; Fahrzeug.Kaufdatum)
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