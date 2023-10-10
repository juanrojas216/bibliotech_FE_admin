class RegistrarUsuarioDto {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegistrarUsuarioDto(this.firstName, this.lastName, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
