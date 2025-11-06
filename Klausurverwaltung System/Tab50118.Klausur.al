table 50118 Klausur
{
    DataClassification = ToBeClassified;

    fields
    {


        field(1; "Modul"; Text[50])
        {
            DataClassification = ToBeClassified;


            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec.Modul = '' then
                    Error('Bitte einen gültigen Modulnamen eingeben.');
            end;
        }

        field(2; "Modulnummer"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin

                if rec.Modulnummer = 0 then
                    Error('Bitte eine gültige Modulnummer eingeben');

            end;

        }

        field(3; "Semester"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Prüfer"; Text[25])
        {
            DataClassification = ToBeClassified;

        }



    }

    keys
    {
        key(pk; Modul, Modulnummer, Semester)
        {
            Clustered = true;
        }

        // key(sk; modul)
        // {

        //     Clustered = false;
        // }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        if rec.Modulnummer = 0 then
            Error('Bitte eine gültige Modulnummer eingeben');


        if rec.Modul = '' then
            Error('Bitte einen gültigen Modunname eingeben');
    end;

    trigger OnModify()
    begin
        if rec.Modulnummer = 0 then
            Error('Bitte eine gültige Modulnummer eingeben');


        if rec.Modul = '' then
            Error('Bitte einen gültigen Modunname eingeben');
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}