// Pet = the "form" every pet fills in. This is our main entity.
class Pet {
  // The 5 fields. "final" = set once, never changed.
  final String name;
  final String breed;
  final int age;
  final String imagePath;
  final bool isVaccinated;

  // Constructor = the order form. "required" = you must fill it in.
  const Pet({
    required this.name,
    required this.breed,
    required this.age,
    required this.imagePath,
    required this.isVaccinated,
  });
}