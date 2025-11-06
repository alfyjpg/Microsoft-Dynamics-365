tableextension 50104 tab5200 extends Employee


{
    fields
    {
        field(50000; "Führerschein"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Keinem","PKW","LKW";
        }

        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}