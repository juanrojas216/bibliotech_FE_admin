import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void accionesPublicacion(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('ACCIONES', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {
                ref
                    .read(routesProvider)
                    .push('/publicacion/detalle', extra: 1);
              },
              leading: const Icon(Icons.plagiarism_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Ver detalle',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {},
              leading: const Icon(Icons.comment),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Ver comentarios',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {},
              leading: const Icon(Icons.account_tree_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Ver ejemplares',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: CupertinoListTile.notched(
              onTap: () {},
              leading: const Icon(Icons.link),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                'Link digital',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        ElevatedButton(onPressed: () {
          ref.read(routesProvider).pop();
        }, child: const Text('CANCELAR'))
      ],
    ),
  );
}