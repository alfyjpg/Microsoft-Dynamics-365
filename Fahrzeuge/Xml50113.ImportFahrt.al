xmlport 50113 ImportFahrt
{

    Format = xml;
    Direction = Import;

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



    var
        myInt: Integer;
}