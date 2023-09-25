import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/repository/ediciones.repository.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/validations/nombreEdicion.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EdicionEditar extends ConsumerStatefulWidget {
  
  final int idEdicion;

  const EdicionEditar(this.idEdicion, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EdicionEditarState();
}

class _EdicionEditarState extends ConsumerState<EdicionEditar> {

  String edicion = '';

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Editar edicion',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          edicion = value,
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
            if (!nombreEdicionValidacion(edicion)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(edicionesProvider)
                        .firstWhere((e) => e.id == widget.idEdicion)
                        .copyWith(nombre: edicion),
                    nombreProvider: updateEdicionProvider,
                    mensajeResult: 'EDICIÓN MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR EDICIÓN'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreEdicionValidacion(edicion))
                ? const MaterialStatePropertyAll(Colors.grey)
                : const MaterialStatePropertyAll(Colors.purple),
          ),
          child: Text('Guardar cambios',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
          onPressed: () {
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => EliminarEntidad(
                    nombreProvider: deleteEdicionProvider(widget.idEdicion),
                    mensajeResult: 'EDICIÓN ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR EDICIÓN'));
          },
          child: Text('Eliminar edicion',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: Text('Cancelar',
              style: GoogleFonts.poppins(), textAlign: TextAlign.center),
        )
      ],
    );
  }
}

