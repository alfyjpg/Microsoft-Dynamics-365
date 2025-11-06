codeunit 50126 Notendurchschnitt
{
    trigger OnRun()
    begin

    end;

    var

        StudentRec: Record Student;
        ErgebnisRec: Record Ergebnis;
        anzahl: Integer;
        summeNoten: Decimal;
        myInt: Integer;


    local procedure initializing()

    begin
        anzahl := 0;
        summeNoten := 0;

    end;

    procedure NotenBerechnen(MatrikelnummerRec: Integer): Decimal
    var

    begin

        initializing();
        ErgebnisRec.SetRange(Studentenmatrikelnummer, MatrikelnummerRec);
        if ErgebnisRec.Find('-') then begin

            repeat

                if (ErgebnisRec.Note <> 0.0) and (ErgebnisRec.Note <> 5.0) then begin
                    summeNoten := summeNoten + ErgebnisRec.Note;
                    anzahl := anzahl + 1;
                end

            until ErgebnisRec.Next() = 0;

            if anzahl > 0 then begin
                summeNoten := summeNoten / anzahl;
                exit(summeNoten)
            end
            else
                exit(0);
        end
        // else begin
        //     Message('%1 hat soweit noch keine Belegung bestanden', ErgebnisRec.Studentenname);
        //     exit(0);
        // end;
    end;


}

