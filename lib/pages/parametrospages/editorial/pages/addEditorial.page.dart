import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/validations/nombreEditorial.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';

class EditorialAdd extends ConsumerStatefulWidget {
  const EditorialAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEdicionState();
}

class _AddEdicionState extends ConsumerState<EditorialAdd> {
  String nombreEditorial = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva editorial',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          nombreEditorial = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre editorial',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreEditorialValidacion(nombreEditorial)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreEditorial,
                        nombreProvider: createEditorialProvider,
                        mensajeResult: 'EDITORIAL CREADA',
                        mensajeError: 'ERROR AL CREAR EDITORIAL',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreEditorialValidacion(nombreEditorial))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar editorial')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
