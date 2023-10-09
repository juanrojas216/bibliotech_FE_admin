import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
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
          title: Text("PARÁMETROS", style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
          content: SizedBox(
            width: 400,
            height: 300,
            child: ListView(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Editoriales',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/editorial');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Ediciones',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/edicion');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Autores',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/autor');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Categorias',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/categoria');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Tipo de publicación',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/tipospublicacion');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Ubicaciones',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/ubicacion');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Facultades',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/facultad');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Carreras',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/carrera');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: CupertinoListTile(
                    title: Text('Plataformas',
                        style: GoogleFonts.poppins(color: Colors.white)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    backgroundColorActivated: Colors.transparent,
                    leading: const Icon(Icons.edit),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      ref.read(routesProvider).pop();
                      ref.read(routesProvider).push('/parametro/plataforma');
                    },
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  side: const BorderSide(color: Colors.purple)
                  ),
              icon: const Icon(Icons.close, color: Colors.purple,),
              label: Text('Cerrar', style: GoogleFonts.poppins(color: Colors.purple)),
              onPressed: () {
                ref.read(routesProvider).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
