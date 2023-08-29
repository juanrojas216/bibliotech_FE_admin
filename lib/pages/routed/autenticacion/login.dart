import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        hintText: 'Su número de dni',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
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
                        hintText: 'Su contraseña',
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          bool isOk = _formKey.currentState!.validate();
                          if (isOk) {
                            ref.read(routesProvider).pushReplacement('/publicacion');
                          }
                        },
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
