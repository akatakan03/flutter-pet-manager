import 'friendly.dart';
import 'pet.dart';

class Cat extends Pet implements Friendly {
  Cat(String name) : super(name);

  @override
  String makeSound() {
    return "Meow!";
  }

  @override
  String beFriendly() {
    return "Mumbling.";
  }
}