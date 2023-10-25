class MyUser {
  final String name;
  final String surname;
  final String dateOfBirth;

  MyUser({
    required this.name,
    required this.surname,
    required this.dateOfBirth,
  });

  factory MyUser.fromMap(Map<String, dynamic> data) {
    return MyUser(
      name: data['name'] ?? '',
      surname: data['surname'] ?? '',
      dateOfBirth: data['dateOfBirth'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MyUser {'
        'Name: $name, '
        'Surname: $surname, '
        'Date of Birth: $dateOfBirth'
        '}';
  }
}
