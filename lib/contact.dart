class Contact {
   String firstName;
   String? lastName;
   String? email;
   String phoneNumber;

  Contact({
    required this.firstName,
    this.lastName,
    this.email,
    required this.phoneNumber,
  });
}
