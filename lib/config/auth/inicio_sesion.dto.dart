class InicioSesionDto{
  final String email;
  final String password;

  InicioSesionDto(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}