import 'package:bibliotech_admin/config/auth/get_token.controller.dart';
import 'package:bibliotech_admin/config/auth/inicio_sesion.dto.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/validations/login.validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/iniciarSesionPopup.page.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String email = '';
  String password = '';

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
              key: widget._formKey,
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if(!loginValidacion(email, password)) return;
                          showDialog(
                              context: context,
                              builder: (_) => IniciarSesion(
                                  nombreProvider: getTokenProvider(InicioSesionDto(email, password)),
                                  mensajeResult: 'SESIÓN INICIADA CON ÉXITO',
                                  mensajeError: 'ERROR AL INICIAR SESIÓN'));
                        },
                        style: ButtonStyle(
                          backgroundColor: loginValidacion(email, password)
                            ? const MaterialStatePropertyAll(Colors.purple) 
                            : const MaterialStatePropertyAll(Colors.grey)
                        ),
                        child: Text('Iniciar Sesión',
                            style: GoogleFonts.poppins()))
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


