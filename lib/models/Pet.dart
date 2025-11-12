abstract class Pet {
  static int totalPets = 0;

  String name;
  Pet(this.name) {
    totalPets++;
  }

  Pet.fromName(this.name) {
    totalPets++;
  }
  
  String makeSound();
}