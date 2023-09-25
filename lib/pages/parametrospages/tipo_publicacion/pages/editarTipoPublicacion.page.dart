import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';
import '../repository/tiposPublicacion.respository.dart';
import '../validations/nombreTipoPublicacion.validation.dart';

class TipoPublicacionEditar extends ConsumerStatefulWidget {
  final int idTipoPublicacion;

  const TipoPublicacionEditar(this.idTipoPublicacion, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TipoPublicacionEditarState();
}

class _TipoPublicacionEditarState extends ConsumerState<TipoPublicacionEditar> {
  var tipoPublicacion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar tipo de publicación',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: tipoPublicacion,
        onChanged: (value) => {
          tipoPublicacion = value,
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
            if (!nombreTipoPublicacionValidacion(tipoPublicacion)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(tiposPublicacionProvider)
                        .firstWhere((e) => e.id == widget.idTipoPublicacion)
                        .copyWith(nombre: tipoPublicacion),
                    nombreProvider: updateTipoPublicacionProvider,
                    mensajeResult: 'TIPO DE PUBLICACIÓN MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR EL TIPO DE PUBLICACIÓN'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreTipoPublicacionValidacion(tipoPublicacion))
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
                    nombreProvider:
                        deleteTipoPublicacionProvider(widget.idTipoPublicacion),
                    mensajeResult: 'TIPO DE PUBLICACIÓN ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR EL TIPO DE PUBLICACIÓN'));
          },
          child: Text('Eliminar tipo de publicación',
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
