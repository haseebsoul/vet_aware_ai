import '../models/pet.dart';

// The pile of 4 filled forms. Fake data only, no real pets.
// Later (Assignment 4) we replace this with real saved data.
const List<Pet> dummyPets = [
  Pet(
    name: 'Bella',
    breed: 'Labrador',
    age: 3,
    imagePath: 'assets/images/bella_dog.jpg',
    isVaccinated: true,
  ),
  Pet(
    name: 'Luna',
    breed: 'Persian Cat',
    age: 2,
    imagePath: 'assets/images/luna_cat.jpg',
    isVaccinated: true,
  ),
  Pet(
    name: 'Max',
    breed: 'German Shepherd',
    age: 5,
    imagePath: 'assets/images/max_dog.jpg',
    isVaccinated: false,
  ),
  Pet(
    name: 'Coco',
    breed: 'Parrot',
    age: 1,
    imagePath: 'assets/images/coco_parrot.jpg',
    isVaccinated: false,
  ),
  Pet(
    name: 'Rocky',
    breed: 'Bulldog',
    age: 4,
    imagePath: 'assets/images/max_dog.jpg',
    isVaccinated: true,
  ),
];
