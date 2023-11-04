class Auth {
  static bool isActive = false;
  static String? name;
  static List<String>? roles;

  static Map<String, bool> autor = {
    "crear": true,
    "modificar": true,
    "eliminar": true,
    "leer": true,
  };
}
