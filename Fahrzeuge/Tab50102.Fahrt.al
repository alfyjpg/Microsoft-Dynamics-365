table 50102 Fahrt
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fahrer"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("Führerschein" = filter(PKW | LKW));

        }


        field(2; "Nummer"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(3; "Fahrzeug"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Fahrzeug.Kennzeichen;
        }

        field(4; "Fahrtbeginn"; DateTime)
        {
            DataClassification = ToBeClassified;

        }

        field(5; "Fahrtende"; DateTime)
        {
            DataClassification = ToBeClassified;
        }

        field(6; "Zweck der Fahrt"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "KMH FahrtBeginn"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }
        field(8; "KMH FahrtEnde"; Decimal)
        {

            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }
        field(9; "Gefahrene KMH"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 1 : 1;
        }

        field(10; "Führerschein"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Keinen","PKW","LKW";
            TableRelation = IF (Führerschein = CONST(PKW)) Fahrzeug.Kennzeichen WHERE(Typ = filter(Kombi | Transporter)) ELSE
            Fahrzeug.Kennzeichen;
        }
    }


    keys
    {
        key(PK; Fahrer, Nummer)
        {
            Clustered = true;
            SumIndexFields = "Gefahrene KMH";
        }

        key(sk; Fahrtbeginn)
        {

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