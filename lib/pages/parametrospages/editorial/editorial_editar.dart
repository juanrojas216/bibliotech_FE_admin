import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/editorial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delete_editorial.dart';
import 'modificar_editorial.dart';

class EditarEditorial extends ConsumerStatefulWidget {
  final int idEditorial;

  const EditarEditorial(this.idEditorial, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EdititarEditorialState();
}

class _EdititarEditorialState extends ConsumerState<EditarEditorial> {
  String nombreEditorial = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar editorial',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreEditorial,
        onChanged: (value) => {
          nombreEditorial = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre de la editorial',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
            ref
                .read(listaEditorialesABMProvider.notifier)
                .modificarEditorial(widget.idEditorial, nombreEditorial);
            showDialog(
                context: context,
                builder: (_) => const ModificarEditorialDialog());
          },
          child: Text('Guardar cambios',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
          onPressed: () {
            ref.read(routesProvider).pop();
            ref
                .read(listaEditorialesABMProvider.notifier)
                .deleteEditorial(widget.idEditorial);
            showDialog(
                context: context,
                builder: (_) => const DeleteEditorialDialog());
          },
          child: Text('Eliminar editorial',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: Text('Cencelar',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        )
      ],
    );
  }
}
