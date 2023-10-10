import 'package:bibliotech_admin/config/auth/inicio_sesion.dto.dart';
import 'package:bibliotech_admin/config/auth/registrar_usuario.dto.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/validations/login.validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/api/http_admin.dart';
import '../../../../config/auth/auth.service.dart';
import '../../../../config/auth/token_admin.dart';
import '../../../../config/helpers/http_method.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';

  bool mostrarError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', scale: 3),
            Form(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                        mostrarError = false;
                        setState(() {});
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Ingrese su email',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                        mostrarError = false;
                        setState(() {});
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'CONTRASEÑA',
                        hintText: 'Su contraseña',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        firstName = value;
                        mostrarError = false;
                        setState(() {});
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        hintText: 'Su nombre',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        lastName = value;
                        mostrarError = false;
                        setState(() {});
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                        hintText: 'Su apellido',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          if (!loginValidacion(email, password)) return;
                          var response = await ref.read(apiProvider).request(
                                '/auth/signup',
                                method: HttpMethod.signing,
                                body: RegistrarUsuarioDto(
                                        email, password, firstName, lastName)
                                    .toMap(),
                              );

                          if (response.error != null) {
                            mostrarError = true;
                            setState(() {});
                            return;
                          }

                          await storage.write(
                            key: 'token',
                            value: response.data!['token'],
                          );

                          Auth.isActive = true;
                          ref
                              .read(routesProvider)
                              .pushReplacement('/publicacion');

                          // showDialog(
                          //     context: context,
                          //     builder: (_) => IniciarSesion(
                          //         entidad: InicioSesionDto(email, password),
                          //         provider: getTokenProvider,
                          //         mensajeResult: 'SESIÓN INICIADA CON ÉXITO',
                          //         mensajeError: 'ERROR AL INICIAR SESIÓN'));
                        },
                        style: ButtonStyle(
                            backgroundColor: loginValidacion(email, password)
                                ? const MaterialStatePropertyAll(Colors.purple)
                                : const MaterialStatePropertyAll(Colors.grey)),
                        child: Text('Registrar usuario',
                            style: GoogleFonts.poppins())),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: mostrarError,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error),
                              SizedBox(height: 5),
                              Text(
                                  'Hubo un problema, no se pudo registrar el usuario.'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
