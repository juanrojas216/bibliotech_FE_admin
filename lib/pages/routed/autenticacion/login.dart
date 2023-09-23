import 'package:bibliotech_admin/config/auth/logged_in_state_info.dart';
import 'package:bibliotech_admin/pages/routed/autenticacion/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String user = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    void login() {
      bool isOk = _formKey.currentState!.validate();
      if (isOk) {
        if (loginFunc(user, password)) {
          print(ref.read(loggedInProvider));
          ref.read(loggedInProvider.notifier).state = true;
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', scale: 3),
            Form(
              key: _formKey,
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value != null) {
                          if (value.length >= 6) {
                            return null;
                          }
                        }
                        return 'Error en el dato ingresado.';
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'DNI',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) => {
                        user = value,
                        setState(() {}),
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null) {
                          if (value.trim().length >= 8) {
                            return null;
                          }
                        }
                        return 'Error en la contraseña ingresada.';
                      },
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        labelText: 'CONTRASEÑA',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (v) => login,
                      onChanged: (value) => {
                        password = value,
                        setState(() {}),
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: login,
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
