import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';
import '../dto/categoria.dto.dart';
import '../validations/nombreCategoria.validation.dart';

class CategoriaAdd extends ConsumerStatefulWidget {
  const CategoriaAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCategoriaState();
}

class _AddCategoriaState extends ConsumerState<CategoriaAdd> {
  
  String nombreCategoria = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva cateogoria',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: nombreCategoria,
        onChanged: (value) => {
          nombreCategoria = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre categoría',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (!nombreCategoriaValidacion(nombreCategoria)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<CategoriaDto>(
                        entidad: CategoriaDto(nombre: nombreCategoria),
                        nombreProvider: createCategoriaProvider,
                        mensajeResult: 'CATEGORÍA CREADA',
                        mensajeError: 'ERROR AL CREAR CATEGORÍA',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: (!nombreCategoriaValidacion(nombreCategoria))
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar categoría')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
