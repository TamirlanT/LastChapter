package animals;

import java.text.ParseException;
import java.util.Date;

public abstract class Pack_Animals extends Animals {

    public PackAnimal(String name, Date birthDate) {
        super(name, birthDate);
    }

    public PackAnimal(String name, String birthDate) throws ParseException {
        super(name, birthDate);
    }
}