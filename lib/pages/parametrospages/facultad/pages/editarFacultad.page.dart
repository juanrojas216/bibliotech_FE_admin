import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/repository/facultades.repository.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/validations/nombreFacultad.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultadEditar extends ConsumerStatefulWidget {
  
  final int idFacultad;

  const FacultadEditar(this.idFacultad, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FacultadEditarState();
}

class _FacultadEditarState extends ConsumerState<FacultadEditar> {

  late String facultad;

  @override
  void initState() {
    super.initState();
    facultad = ref.read(facultadesProvider).firstWhere((e) => e.id == widget.idFacultad).nombre;
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Editar facultad',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: facultad,
        onChanged: (value) => {
          facultad = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre de la facultad',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (!nombreFacultadValidacion(facultad)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(facultadesProvider)
                        .firstWhere((e) => e.id == widget.idFacultad)
                        .copyWith(nombre: facultad),
                    nombreProvider: updateFacultadProvider,
                    mensajeResult: 'FACULTAD MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR FACULTAD'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreFacultadValidacion(facultad))
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
                    nombreProvider: deleteFacultadProvider(widget.idFacultad),
                    mensajeResult: 'EDICIÓN ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR EDICIÓN'));
          },
          child: Text('Eliminar facultad',
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

