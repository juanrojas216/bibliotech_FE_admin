import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';
import '../validations/nombreTipoPublicacion.validation.dart';

class TipoPublicacionAdd extends ConsumerStatefulWidget {
  const TipoPublicacionAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TipoPublicacionState();
}

class _TipoPublicacionState extends ConsumerState<TipoPublicacionAdd> {
  String nombreTipoPublicacion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo tipo de publicación',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreTipoPublicacion,
        onChanged: (value) => {
          nombreTipoPublicacion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre tipo de publicación',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreTipoPublicacionValidacion(nombreTipoPublicacion)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreTipoPublicacion,
                        nombreProvider: createTipoPublicacionProvider,
                        mensajeResult: 'TIPO PUBLICACIÓN CREADA',
                        mensajeError: 'ERROR AL CREAR TIPO PUBLICACIÓN',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreTipoPublicacionValidacion(nombreTipoPublicacion))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar tipo de publicación')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
