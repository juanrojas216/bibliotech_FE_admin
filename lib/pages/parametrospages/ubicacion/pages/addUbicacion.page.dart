import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/dto/ubicacion.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/ubicacion/validations/descripcionUbicacion.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class UbicacionAdd extends ConsumerStatefulWidget {
  const UbicacionAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUbicacionState();
}

class _AddUbicacionState extends ConsumerState<UbicacionAdd> {
  
  String descripcion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva ubicacion',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          descripcion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Descripción ubicación',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!descripcionUbicacionValidacion(descripcion)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad(
                        entidad: UbicacionDto(descripcion: descripcion, ocupada: false),
                        nombreProvider: createUbicacionProvider,
                        mensajeResult: 'UBICACIÓN CREADA',
                        mensajeError: 'ERROR AL CREAR UBICACIÓN',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!descripcionUbicacionValidacion(descripcion))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar ubicación')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
