table 50117 Student
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;


            trigger OnValidate()
            var
                myInt: Integer;
            begin

                if rec.Name = '' then
                    Error('Bitte einen Name eingeben');
            end;
        }

        field(2; "Matrikelnummer"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var

                MatNumVali: Codeunit 50124;
                myInt: Integer;
            begin

                if rec.Matrikelnummer = 0 then begin

                    Error('Bitte geben Sie ein gültige Matrikelnummer');
                end;

                MatNumVali.MatrikelNummerValidation(rec.Matrikelnummer);
            end;



        }

        field(3; "Notedurschschnitt"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
            //  FieldClass = FlowField;
            // CalcFormula = average(Ergebnis.Note where(Studentenmatrikelnummer = field(Matrikelnummer)));



        }

        field(4; "FH E-Mail"; code[50])
        {
            DataClassification = ToBeClassified;

        }

        field(5; "Adresse"; Text[70])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Handynummer"; Integer)
        {
            DataClassification = ToBeClassified;

        }

        field(7; "Semester"; Integer)
        {
            DataClassification = ToBeClassified;

        }


    }

    keys
    {
        key(pk; Name, Matrikelnummer)
        {
            Clustered = true;
        }


    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        if rec.Matrikelnummer = 0 then
            Error('Bitte geben Sie ein gültige Matrikelnummer');

        if rec.Name = '' then
            Error('Bitte einen Name eingeben');
    end;

    trigger OnModify()
    begin
        if rec.Matrikelnummer = 0 then
            Error('Bitte geben Sie ein gültige Matrikelnummer');

        if rec.Name = '' then
            Error('Bitte einen Name eingeben');

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}