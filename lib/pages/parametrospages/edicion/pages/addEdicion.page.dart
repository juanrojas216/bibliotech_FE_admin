import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/validations/nombreEdicion.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class EdicionAdd extends ConsumerStatefulWidget {
  const EdicionAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEdicionState();
}

class _AddEdicionState extends ConsumerState<EdicionAdd> {
  String nombreEdicion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva edicion',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          nombreEdicion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre edicion',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreEdicionValidacion(nombreEdicion)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreEdicion,
                        nombreProvider: createEdicionProvider,
                        mensajeResult: 'EDICIÓN CREADA',
                        mensajeError: 'ERROR AL CREAR EDICIÓN',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreEdicionValidacion(nombreEdicion))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar edicion')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
