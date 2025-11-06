xmlport 50125 "ExportErgebnisse"
{

    Format = Xml;
    Direction = Export;

    schema
    {
        textelement(Ergebnisse)
        {

            tableelement(Ergebnis; Ergebnis)
            {


                fieldelement(Mdoulname; Ergebnis.Modulname)
                {


                }

                fieldelement(Modulnummer; Ergebnis.Modulnummer)
                {


                }
                fieldelement(Name; Ergebnis.Studentenname)
                {


                }
                fieldelement(Matrikelnummer; Ergebnis.Studentenmatrikelnummer)
                {

                }
                fieldelement(Note; Ergebnis.Note)
                {

                }
                fieldelement(Semester; Ergebnis.Semester)
                {

                }
            }
        }

    }



    var
        myInt: Integer;
        ErgebnisRec: Record Ergebnis;

}