import 'flyable.dart';
import 'pet.dart';

class Bird extends Pet with Flyable {
  Bird(String name) : super(name);

  @override
  String makeSound() {
    return "Chirp Chirp!";
  }

}