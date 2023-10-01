import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/facultad/validations/nombreFacultad.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class FacultadAdd extends ConsumerStatefulWidget {
  const FacultadAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFacultadState();
}

class _AddFacultadState extends ConsumerState<FacultadAdd> {
  
  String nombreFacultad = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva facultad',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreFacultad,
        onChanged: (value) => {
          nombreFacultad = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre facultad',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreFacultadValidacion(nombreFacultad)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreFacultad,
                        nombreProvider: createFacultadProvider,
                        mensajeResult: 'FACULTAD CREADA',
                        mensajeError: 'ERROR AL CREAR FACULTAD',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreFacultadValidacion(nombreFacultad))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar facultad')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
