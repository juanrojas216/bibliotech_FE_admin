import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/repository/ubicaciones.repository.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/validations/descripcionUbicacion.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class UbicacionEditar extends ConsumerStatefulWidget {
  
  final int idUbicacion;

  const UbicacionEditar(this.idUbicacion, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UbicacionEditarState();
}

class _UbicacionEditarState extends ConsumerState<UbicacionEditar> {

  String ubicacion = '';

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Editar ubicación',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          ubicacion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nueva descripción de la ubicación',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (!descripcionUbicacionValidacion(ubicacion)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(ubicacionesProvider)
                        .firstWhere((e) => e.id == widget.idUbicacion)
                        .copyWith(descripcion: ubicacion),
                    nombreProvider: updateUbicacionProvider,
                    mensajeResult: 'UBICACIÓN MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR UBICACIÓN'));
          },
          style: ButtonStyle(
            backgroundColor: (!descripcionUbicacionValidacion(ubicacion))
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
                    nombreProvider: deleteUbicacionProvider(widget.idUbicacion),
                    mensajeResult: 'UBICACIÓN ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR UBICACIÓN'));
          },
          child: Text('Eliminar ubicación',
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

