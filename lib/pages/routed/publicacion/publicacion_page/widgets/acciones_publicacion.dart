import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void accionesPublicacion(BuildContext context, WidgetRef ref) {
  showCupertinoDialog(
    context: context,
    builder: (_) => SizedBox(
      width: 100,
      height: 100,
      child: AlertDialog(
        title: Text("Acciones",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
        scrollable: true,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoListTile(
              title: Text('Publicacion', style: GoogleFonts.poppins()),
              leading: const Icon(Icons.search_rounded),
              trailing: const CupertinoListTileChevron(),              
              onTap: () {
                ref.read(routesProvider).pushReplacement('/publicacion');
              },
            ),
            CupertinoListTile(
              title: Text('Prestamo', style: GoogleFonts.poppins()),
              leading: const Icon(Icons.search_rounded),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                ref.read(routesProvider).pushReplacement('/prestamo');
              },
            ),
            CupertinoListTile(
              title: Text('Multa', style: GoogleFonts.poppins()),
              leading: const Icon(Icons.search_rounded),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                ref.read(routesProvider).pushReplacement('/multa');
              },
            ),
            CupertinoListTile(
              title: Text('Usuario', style: GoogleFonts.poppins()),
              leading: const Icon(Icons.search_rounded),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                ref.read(routesProvider).pushReplacement('/usuario');
              },
            ),
            CupertinoListTile(
              title: Text('Reporte', style: GoogleFonts.poppins()),
              leading: const Icon(Icons.search_rounded),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                ref.read(routesProvider).pushReplacement('/reporte');
              },
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(top: 10, bottom: 20),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              child: Text('Cancelar', style: GoogleFonts.poppins()),
              onPressed: () {
                ref.read(routesProvider).pop();
              },
            ),
        ],
      ),
    ),
  );
}
