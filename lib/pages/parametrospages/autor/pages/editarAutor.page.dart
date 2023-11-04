import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/dto/autor.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/resumenAutor.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/auth/auth.service.dart';
import '../repository/autores.repository.dart';

class AutorEditar extends ConsumerStatefulWidget {
  
  final int idAutor;

  const AutorEditar(this.idAutor, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AutorEditarState();
}

class _AutorEditarState extends ConsumerState<AutorEditar> {
  
  late String nombre;
  late DateTime fechaNacimiento;
  late String nacionalidad;
  late String biografia;

  @override
  void initState() {
    super.initState();
    var autor = ref.read(autoresProvider).firstWhere((e) => e.id == widget.idAutor);
    nombre = autor.nombre; 
    fechaNacimiento = autor.fechaNacimiento; 
    nacionalidad = autor.nacionalidad; 
    biografia = autor.biografia; 
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar autor',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  initialValue: nombre,
                  onChanged: (value) {
                    nombre = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nombre',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: nacionalidad,
                  onChanged: (value) {
                    nacionalidad = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nacionalidad',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Fecha Nacimiento',
                  ),
                  lastDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  initialValue: fechaNacimiento,
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (DateTime value) {
                    fechaNacimiento = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 15,
                  initialValue: biografia,
                  onChanged: (value) {
                    biografia = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Biografía',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        Visibility(
          visible: Auth.autor["modificar"] as bool,
          child: ElevatedButton(
              onPressed: () {
                if (!resumenAutorValidacion(
                  AutorDto(
                      nombre: nombre,
                      fechaNacimiento: fechaNacimiento,
                      nacionalidad: nacionalidad,
                      biografia: biografia),
                )) return;
                ref.read(routesProvider).pop();
                showDialog(
                    context: context,
                    builder: (_) => ModificarEntidad(
                        entidad: ref
                            .read(autoresProvider)
                            .firstWhere((e) => e.id == widget.idAutor)
                            .copyWith(
                                nombre: nombre,
                                biografia: biografia,
                                fechaNacimiento: fechaNacimiento,
                                nacionalidad: nacionalidad),
                        nombreProvider: updateAutorProvider,
                        mensajeResult: 'AUTOR MODIFICADO',
                        mensajeError: 'ERROR AL MODIFICAR AUTOR'));
              },
              style: ButtonStyle(
                backgroundColor: (!resumenAutorValidacion(
                  AutorDto(
                      nombre: nombre,
                      fechaNacimiento: fechaNacimiento,
                      nacionalidad: nacionalidad,
                      biografia: biografia),
                ))
                    ? const MaterialStatePropertyAll(Colors.grey)
                    : const MaterialStatePropertyAll(Colors.purple),
              ),
              child: const Text('Modificar autor')),
        ),
        Visibility(
          visible: Auth.autor["eliminar"] as bool ,
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
            onPressed: () {
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => EliminarEntidad(
                      nombreProvider: deleteAutorProvider(widget.idAutor),
                      mensajeResult: 'AUTOR ELIMINADO',
                      mensajeError: 'ERROR AL ELIMINAR AUTOR'));
            },
            child: Text('Eliminar autor',
                style: GoogleFonts.poppins(), textAlign: TextAlign.center),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
