report 50130 "Studierendenergebnisse"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLStudierendenergebnisse.rdl';


    dataset
    {
        dataitem(Studentdaten; Student)
        {

            RequestFilterFields = Matrikelnummer;
            column(Name; Name)
            {

            }
            column(Matrikelnummer; Matrikelnummer)
            {

            }
            column(Semester; Semester)
            {

            }

            column(Notedurschschnitt; Notedurschschnitt)
            {

            }




            dataitem(Ergebnisdaten; Ergebnis)
            {

                DataItemLinkReference = Studentdaten;
                DataItemLink = Studentenmatrikelnummer = field(Matrikelnummer);

                column(Pruefungsname; modulname)
                {

                }


                column(Pruefungsnummer; Modulnummer)
                {

                }

                column(PrufungsSemester; Semester)
                {

                }

                column(Note; Note)
                {

                }



            }
        }
    }
}


// column(Mail; "FH E-Mail")
// {

// }