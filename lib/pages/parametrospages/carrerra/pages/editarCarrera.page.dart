import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/carrerra/validations/nombreCarrera.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/index.dart';
import '../repository/carreras.repository.dart';

class CarreraEditar extends ConsumerStatefulWidget {
  
  final int idCarrera;

  const CarreraEditar(this.idCarrera, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarreraEditarState();
}

class _CarreraEditarState extends ConsumerState<CarreraEditar> {

  String carrera = '';

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Editar carrera',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          carrera = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nuevo nombre de la carrera',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (!nombreCarreraValidacion(carrera)) return;
            ref.read(routesProvider).pop();
            showDialog(
                context: context,
                builder: (_) => ModificarEntidad(
                    entidad: ref
                        .read(carrerasProvider)
                        .firstWhere((e) => e.id == widget.idCarrera)
                        .copyWith(nombre: carrera),
                    nombreProvider: updateCarreraProvider,
                    mensajeResult: 'CARRERA MODIFICADA',
                    mensajeError: 'ERROR AL MODIFICAR CARRERA'));
          },
          style: ButtonStyle(
            backgroundColor: (!nombreCarreraValidacion(carrera))
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
                    nombreProvider: deleteCarreraProvider(widget.idCarrera),
                    mensajeResult: 'CARRERA ELIMINADA',
                    mensajeError: 'ERROR AL ELIMINAR CARRERA'));
          },
          child: Text('Eliminar carrera',
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

