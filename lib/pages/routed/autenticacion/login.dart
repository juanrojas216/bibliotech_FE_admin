import 'package:bibliotech_admin/config/auth/token_admin.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/publicaciones_page.dart';
import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        email = value;
                      },
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
                      },
                      validator: (value) {
                        if (value != null) {
                          if (value.trim().length >= 4) {
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
                          bool isOk = widget._formKey.currentState!.validate();
                          if (isOk) {
                            // ref
                            //     .read(routesProvider)
                            //     .pushReplacement('/publicacion');
                            showDialog(
                              context: context,
                              builder: (_) => IngresoLogin(entidad: {
                                "email": email,
                                "password": password
                              }),
                            );
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

class IngresoLogin extends ConsumerWidget {
  final Map<String, String> entidad;

  const IngresoLogin({
    required this.entidad,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var addEntidad = ref.watch(tokenProvider(entidad));

    return addEntidad.when(
      data: (_) => const PublicacionesPage(),
      error: (_, __) => const ResultDialog(
          iconDialog: Icon(Icons.error),
          messageDialog: "No se a podidio iniciar sesión"),
      loading: () => const AlertDialog(content: LinearProgressIndicator()),
    );
  }
}
