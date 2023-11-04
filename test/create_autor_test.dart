import 'package:bibliotech_admin/config/auth/inicio_sesion.dto.dart';
import 'package:bibliotech_admin/config/auth/token_admin.dart';
import 'package:bibliotech_admin/config/helpers/http.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/validations/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/dto/autor.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/biografiaAutor.validation.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/nombreAutor.validation.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/resumenAutor.validation.dart';
import 'package:flutter_test/flutter_test.dart';

var autor = AutorDto(
  nombre: "Jose Perez",
  fechaNacimiento: DateTime(1990, 10, 10),
  nacionalidad: "Argentino",
  biografia: "Escritor destacado por la academia",
);

var inicioSesion = InicioSesionDto("ignacionvalente07@gmail.com", "Ignacio77");

var http = Http(baseUrl: 'http://localhost:8080/api/v1');

void main() {
  group(
    "PRUEBAS DE VALIDACIÓN DE INGRESO DE DATOS",
    () {
      test('Registro de autor valido',
          () => expect(resumenAutorValidacion(autor), true));
      test("Campo nombre invalido para crear autor por caráter inválido",
          () => expect(nombreAutorValidacion("J@se Pepe"), false));
      test(
          "Biografía del autor mayor a 20 caracteres y menor a 300",
          () => expect(
              biografiaAutorValidacion(
                  "Lorem ipsum dolor sit amet consectetur adipiscing, elit ullamcorper viverra aliquet nec congue curabitur, himenaeos et dui fusce sed."),
              true));
    },
  );

  group(
    "PRUEBAS DE SEGURIDAD POR NIVELES DE USUARIO",
    () {
      test('Registro de contraseña, mayuscula, minúscula, números y mayor a 8 caracteres',
          () => expect(expPassword("Password123"), true));

      test("Ingreso de sesión", () async {
        var response = await http.request(
          '/auth/signin',
          method: HttpMethod.signing,
          body: inicioSesion.toMap(),
        );

        expect(response.statusCode, 200);
      });

      test("Acceso denegado a crear usuario", () async {

        final usuario = InicioSesionDto("u@email.com", "Usuario123");

        final inicioSesion = await http.request(
          '/auth/signin',
          method: HttpMethod.signing,
          body: usuario.toMap(),
        );

        await storage.write(
          key: 'token',
          value: inicioSesion.data!['token'],
        );

        final response = await http.request(
          '/auth/signup',
          method: HttpMethod.post,
          body: {
            "firstName": "Nombre",
            "lastName": "Apellido",
            "email": "email@mail.com",
            "password": "Password111",
            "roleIds": [1],
          },
        );

        await storage.deleteAll();

        expect(response.statusCode, 403);
      });
    },
  );
}
