import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';
import '../validations/nombreValor.validation.dart';

class ValorAdd extends ConsumerStatefulWidget {
  const ValorAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddValorState();
}

class _AddValorState extends ConsumerState<ValorAdd> {
  
  String nombreValor = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo valor de categoría',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          nombreValor = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre valor de categoía',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreValorValidacion(nombreValor)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<String>(
                        entidad: nombreValor,
                        nombreProvider: createValorProvider,
                        mensajeResult: 'VALOR DE CATEGORÍA CREADA',
                        mensajeError: 'ERROR AL CREAR VALOR DE CATEGORÍA',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreValorValidacion(nombreValor))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar valor de categoría')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
