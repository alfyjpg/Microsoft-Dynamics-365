report 50131 "Klausurergebnisse"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLKlausurergebnisse.rdl';

    dataset
    {
        dataitem(Klausur; Klausur)
        {


            RequestFilterFields = Modulnummer;

            column(Modulname; Modul)
            {


            }
            column(Modulnummer; Modulnummer)
            {


            }

            column(Semester; Semester)
            {


            }

            dataitem(Ergebnis; Ergebnis)
            {

                DataItemLinkReference = Klausur;
                DataItemLink = Modulnummer = field(Modulnummer);

                column(Studentenname; Studentenname)
                {


                }



                column(Studentenmatrikelnummer; Studentenmatrikelnummer)
                {


                }

                column(Note; Note)
                {


                }
            }
        }
    }
}