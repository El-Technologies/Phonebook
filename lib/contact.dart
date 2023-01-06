class Contact {
  final String firstName;
  final String? lastName;
  final String? email;
  final String phoneNumber;

  Contact({
    required this.firstName,
    this.lastName,
    this.email,
    required this.phoneNumber,
  });
}
