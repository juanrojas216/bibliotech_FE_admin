import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/tipo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delete_tipo.dart';
import 'modificar_tipo.dart';


class EditarTipoPublicacion extends ConsumerStatefulWidget {
  final int idTipo;

  const EditarTipoPublicacion(this.idTipo, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditarTipoPublicacionState();
}

class _EditarTipoPublicacionState extends ConsumerState<EditarTipoPublicacion> {
  
  String nombreTipo = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar tipo de publicación',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreTipo,
        onChanged: (value) => {
          nombreTipo = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre del tipo de publicación',
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
                .read(listaTipoPublicacionABMProvider.notifier)
                .modificarTipoPublicacion(widget.idTipo, nombreTipo);
            showDialog(
                context: context,
                builder: (_) => const ModificarTipoPublicacionDialog());
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
                .read(listaTipoPublicacionABMProvider.notifier)
                .deleteTipoPublicacion(widget.idTipo);
            showDialog(
                context: context,
                builder: (_) => const DeleteTipoPublicacionDialog());
          },
          child: Text('Eliminar tipo',
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
