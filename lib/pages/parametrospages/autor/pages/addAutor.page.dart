import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/dto/autor.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/resumenAutor.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AutorAdd extends ConsumerStatefulWidget {
  const AutorAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditorialState();
}

class _AddEditorialState extends ConsumerState<AutorAdd> {
  String nombre = '';
  DateTime fechaNacimiento = DateTime(1970, 1, 1);
  String nacionalidad = '';
  String biografia = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo autor',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => {
                    nombre = value,
                    setState(() {}),
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
                  onChanged: (value) => {
                    nacionalidad = value,
                    setState(() {}),
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
                  initialValue: '  ',
                  onChanged: (value) => {
                    biografia = value,
                    setState(() {}),
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
        ElevatedButton(
            onPressed: () {
              final autorDto = AutorDto(
                  nombre: nombre,
                  fechaNacimiento: fechaNacimiento,
                  nacionalidad: nacionalidad,
                  biografia: biografia);
              if (!resumenAutorValidacion(autorDto)) return;
              ref.read(routesProvider).pop();
              showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<AutorDto>(
                        entidad: autorDto,
                        nombreProvider: createAutorProvider,
                        mensajeResult: 'AUTOR CREADO',
                        mensajeError: 'ERROR AL CREAR AUTOR',
                      ));
            },
            style: ButtonStyle(
              backgroundColor: resumenAutorValidacion(
                AutorDto(
                    nombre: nombre,
                    fechaNacimiento: fechaNacimiento,
                    nacionalidad: nacionalidad,
                    biografia: biografia),
              )
                  ? const MaterialStatePropertyAll(Colors.purple)
                  : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar autor')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
