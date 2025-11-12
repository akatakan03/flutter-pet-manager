import 'friendly.dart';
import 'pet.dart';

class Dog extends Pet implements Friendly {
  String breed;


  Dog(String name, this.breed) : super(name);

  @override
  String makeSound() {
    return "Woof Woof!";
  }

  @override
  String beFriendly() {
    return "Wagging its tail!";
  }
}