table 50119 Ergebnis
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Modulname; text[50])
        {
            // DataClassification = ToBeClassified;

            FieldClass = FlowField;
            CalcFormula = lookup(Klausur.Modul where(Modulnummer = field(Modulnummer)));

        }

        field(2; "Modulnummer"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Klausur.Modulnummer;
        }


        field(3; Studentenname; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Student.Name where(Matrikelnummer = field(Studentenmatrikelnummer)));
        }

        field(4; Studentenmatrikelnummer; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Student.Matrikelnummer;
            trigger OnValidate()
            var
                myInt: Integer;
                validate: Codeunit 50124;
            begin

                /*
                Diese Methode uberprüft, ob der Studierende schon  in diesem Modul bestanden hat oder nicht
                Bestanden -------> dann Fehlermeldung sollte angezeigt werden
                Nicht bestanden -----> Eine Note durfte eingetragen werden
                */
                validate.BestandenValidation(rec.Studentenmatrikelnummer, rec.Modulnummer);


                /* Hier die Methode sollte uberprüfen, dass der Student seine Versuchanzahl noch nicht überschritten hat 
                Ja------> Dann sollte ein True zurückgegebn wird und infolgedessen wird der Versuche nachgezählt und zu dem Ergebnis zugeordnet
                Nein ------> Dann sollte Falsch zurrück gegegben und daher wird keine VErsuche nachgezählt, weil der Studierende schon seine Versuche verzehrt 
                und es gibt keine 4 verscuh */

                if validate.GreenLight(Rec.Studentenmatrikelnummer, Rec.Modulnummer) then begin
                    rec.Versuch := validate.VersuchZähler(rec.Studentenmatrikelnummer, rec.Modulnummer);
                end;
            end;


        }
        field(5; Note; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;


            trigger OnValidate()
            var

                ampel: Codeunit 50124;
            begin

                // Diese Methode uberprüft, ob der Student immer noch genug Versuchanzahl hat
                // in dem die Methode zählt alle Belegung in dem Modul vim Student nach 
                // Anzahl der Versuche < 3 -------->  true zurück und belegen darf
                // Anzahl der Versuche >=3 ---------> False zrück und nicht belegen darf  

                // 1) Problem
                // Das Problem hier ist, tortz der Meldung wird manchmal das Ergebnis erstellt und zu keinem Student und mit 0,0 als Note aufgelistet. 


                if not ampel.GreenLight(Rec.Studentenmatrikelnummer, Rec.Modulnummer) then begin
                    Error('Der Studierende darf die Klausur nicht mehr als 3 Mal belegen.', Rec.Studentenname);

                end;


                /* Diese Methode sorgt sich dafür, dass die richtige Note Studierende angelegt wird
                 Ein Array von den gültige Noten erstellt. Programm kummer sich um die Prüfung, dass die eingetranege Note ist eine der Noten des Arrays
                 Note zu dem Array gehört ------> Note wird eingetragen 
                 Note nicht zu dem Array gehört ------> Note wird nciht eingetragen /*/

                if not ampel.RichtigeNote(rec.Note) then begin
                    Error('Keine Valide Note. Bitte seien Sie sicher, dass die Note immer nur um 0,3 vermindert oder erhöht wird also 1,0; 1,3; 1,7 usw. bis hin zu 4. Eine nicht bestandene Klausur erhält die Note 5.0');
                    exit
                end;


                // if rec.Note = 0.0 then
                //     Error('Eine Note muss eingetragen werden!');
            end;

        }
        field(6; Semester; code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var

            begin

                if (Rec.Semester = '') then
                    Error('Semester darf nicht leer sein')

            end;

        }

        field(7; Versuch; Integer)
        {

            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                objekt: Codeunit 50124;
            begin

            end;
        }

    }

    keys
    {
        // key(pk; Modulnummer, Studentenmatrikelnummer, Semester)
        key(pk; Modulnummer, Studentenmatrikelnummer, Semester)
        {
            Clustered = true;
        }


    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var


    trigger OnInsert()
    begin
        // if (Rec.Semester = '') then
        //     Error('Semester darf nicht leer sein')


    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}


