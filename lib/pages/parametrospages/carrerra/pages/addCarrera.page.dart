import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/validations/nombreCarrera.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class CarreraAdd extends ConsumerStatefulWidget {
  const CarreraAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCarreraState();
}

class _AddCarreraState extends ConsumerState<CarreraAdd> {
  
  String nombreCarrera = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva carrera',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          nombreCarrera = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre carrera',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreCarreraValidacion(nombreCarrera)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreCarrera,
                        nombreProvider: createCarreraProvider,
                        mensajeResult: 'CARRERA CREADA',
                        mensajeError: 'ERROR AL CREAR CARRERA',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreCarreraValidacion(nombreCarrera))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar carrera')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
