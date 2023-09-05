import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ParametrosPopUp extends ConsumerWidget {
  const ParametrosPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text("Parámetros"),
      onPressed: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Text("PARÁMETROS",
              style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
          actions: <Widget>[
            SizedBox(
              height: 450,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Editoriales', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/editorial');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Ediciones', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/edicion');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Autores', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/autor');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Categorías', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/categoria');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Ubicación', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/ubicacion');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Tipos de publicación',
                          style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/tipospublicacion');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Facultades', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/facultad');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: Text('Carreras', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref
                            .read(routesProvider)
                            .pushReplacement('/parametro/carrera');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.purple // Background color
                          ),
                      icon: const Icon(Icons.close),
                      label: Text('Cerrar', style: GoogleFonts.poppins()),
                      onPressed: () {
                        ref.read(routesProvider).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
