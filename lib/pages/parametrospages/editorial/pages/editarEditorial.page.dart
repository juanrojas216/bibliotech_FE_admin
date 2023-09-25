import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/repository/editoriales.repository.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/validations/nombreEditorial.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EditorialEditar extends ConsumerStatefulWidget {
  final int idEditorial;

  const EditorialEditar(this.idEditorial, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditorialEditarState();
}

class _EditorialEditarState extends ConsumerState<EditorialEditar> {
  var editorial = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar editorial',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: editorial,
        onChanged: (value) => {
          editorial = value,
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
            if (!nombreEditorialValidacion(editorial)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(editorialesProvider)
                        .firstWhere((e) => e.id == widget.idEditorial)
                        .copyWith(nombre: editorial),
                    nombreProvider: updateEditorialProvider,
                    mensajeResult: 'EDITORIAL MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR EDITORIAL'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreEditorialValidacion(editorial))
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
                    nombreProvider: deleteEditorialProvider(widget.idEditorial),
                    mensajeResult: 'EDITORIAL ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR EDITORIAL'));
          },
          child: Text('Eliminar editorial',
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
