package animals;

import java.text.ParseException;
import java.util.Date;

public abstract class Pets extends Animals {


    public Pets(String name, Date birthDate) {
        super(name, birthDate);
    }

    public Pets(String name, String birthDate) throws ParseException {
        super(name, birthDate);
    }
}