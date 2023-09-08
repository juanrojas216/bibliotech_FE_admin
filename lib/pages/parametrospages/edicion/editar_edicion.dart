import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/edicion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delete_edicion.dart';
import 'modificar_edicion.dart';


class EditarEdicion extends ConsumerStatefulWidget {
  final int idEdicion;

  const EditarEdicion(this.idEdicion, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditarEdicionState();
}

class _EditarEdicionState extends ConsumerState<EditarEdicion> {
  String nombreEdicion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar edicion',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreEdicion,
        onChanged: (value) => {
          nombreEdicion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre de la edicion',
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
                .read(listaEdicionABMProvider.notifier)
                .modificarEdicion(widget.idEdicion, nombreEdicion);
            showDialog(
                context: context,
                builder: (_) => const ModificarEdicionDialog());
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
                .read(listaEdicionABMProvider.notifier)
                .deleteEdicion(widget.idEdicion);
            showDialog(
                context: context,
                builder: (_) => const DeleteEdicionDialog());
          },
          child: Text('Eliminar edicion',
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
