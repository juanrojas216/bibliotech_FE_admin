import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/controllers/deleteValor.controller.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/controllers/updateValor.controller.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../validations/nombreValor.validation.dart';

class ValorEditar extends ConsumerStatefulWidget {
  final int idValor;

  const ValorEditar(this.idValor, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ValorEditarState();
}

class _ValorEditarState extends ConsumerState<ValorEditar> {
  
  late String valor;

  @override
  void initState() {
    super.initState();
    ref.read(categoriasProvider).forEach((e) {
      for (var v in e.valores) { 
        if (v.id == widget.idValor) {
          valor = v.nombre;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar valor de categoria',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: valor,
        onChanged: (value) => {
          valor = value,
          setState((){}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre del valor de la categoria',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (!nombreValorValidacion(valor)) return;
            late Valor nuevoValor;
            ref.read(categoriasProvider).forEach((c) {
            for (var v in c.valores) {
                if (v.id == widget.idValor) {
                  nuevoValor = v.copyWith(nombre: valor);
                }
              }
            });
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: nuevoValor,
                    nombreProvider: updateValorProvider,
                    mensajeResult: 'VALOR DE CATEGORÍA MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR VALOR DE CATEGORÍA'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreValorValidacion(valor))
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
                    nombreProvider: deleteValorProvider(widget.idValor),
                    mensajeResult: 'VALOR DE CATEGORÍA ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR VALOR DE CATEGORÍA'));
          },
          child: Text('Eliminar valor de categoría',
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
