import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/controllers/deleteCategoria.controller.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/controllers/updateCategoria.controller.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../validations/nombreCategoria.validation.dart';

class CategoriaEditar extends ConsumerStatefulWidget {
  final int idCategoria;

  const CategoriaEditar(this.idCategoria, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriaEditarState();
}

class _CategoriaEditarState extends ConsumerState<CategoriaEditar> {
  
  late String categoria;

  @override
  void initState() {
    super.initState();
    categoria = ref.read(categoriasProvider).firstWhere((e) => e.id == widget.idCategoria).nombre;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar categoria',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: categoria,
        onChanged: (value) => {
          categoria = value,
          setState((){}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre de la categoria',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (!nombreCategoriaValidacion(categoria)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(categoriasProvider)
                        .firstWhere((e) => e.id == widget.idCategoria)
                        .copyWith(nombre: categoria),
                    nombreProvider: updateCategoriaProvider,
                    mensajeResult: 'CATEGORÍA MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR CATEGORÍA'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreCategoriaValidacion(categoria))
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
                    nombreProvider: deleteCategoriaProvider(widget.idCategoria),
                    mensajeResult: 'CATEGORÍA ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR CATEGORÍA'));
          },
          child: Text('Eliminar categoría',
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
