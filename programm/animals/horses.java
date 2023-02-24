package animals;

import java.text.ParseException;
import java.util.Date;

public class Horse extends Pack_Animals {


    public Horse(String name, Date birthDate) {
        super(name, birthDate);
    }

    public Horse(String name, String birthDate) throws ParseException {
        super(name, birthDate);
    }

    @Override
    public String getSpecies() {
        return "Лошадь";
    }
}