import animals.Animals;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class YoungAnimal implements Iterable {
    Map<String, Animals> animals;

    public YoungAnimal() {
        this.animals = new HashMap<>();
    }

    public void addAnimal(Animal animal) {
        this.animals.put(animal.getName(), animal);
    }

    public Animal getAnimal(String name) {
        return this.animals.get(name);
    }

    public Animal removeAnimal(String name) {
        return this.animals.remove(name);
    }

    public int getCount() {
        return this.animals.size();
    }

    public boolean containsAnimal(String name) {
        return this.animals.containsKey(name);
    }

    public boolean isEmpty() {
        return this.animals.isEmpty();
    }

    @Override
    public Iterator iterator() {
        return this.animals.values().iterator();
    }
}