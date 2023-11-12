import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/dto/autor.dto.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/validations/resumenAutor.validation.dart';
import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../validations/biografiaAutor.validation.dart';
import '../validations/nacionalidadAutor.validation.dart';
import '../validations/nombreAutor.validation.dart';

//Widget que contiene el formulario para la creación del autor
class AutorAdd extends ConsumerStatefulWidget {
  const AutorAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditorialState();
}

//Wiget que manejar el renderizado y estado de la página
class _AddEditorialState extends ConsumerState<AutorAdd> {
  //Variables que mantienen el estado de la página necesarios
  //para luego crear el dto para enviar al endpoint
  //de creación del autor
  String nombre = '';
  DateTime fechaNacimiento = DateTime(1970, 1, 1);
  String nacionalidad = '';
  String biografia = '';

  //Funcion que renderiza la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //Establecemos el título de la página
      title: Text('Nuevo autor',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 800,
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  //Campo de entrada para el nombre del autor
                  TextFormField(
                    //Funcion que setea el cambio de valor
                    //en la variable nombre y solicita renderizado
                    onChanged: (value) => {
                      nombre = value,
                      setState(() {}),
                    },
                    //Funcion de validación del campo
                    validator: (value) {
                      if (value != null && nombreAutorValidacion(value)) {
                        return null;
                      }
                      //Mensaje de error al no pasar la validación
                      return '''
                          El nombre del autor debe tener una longitud mayor a 3 caracteres.
                          El nombre del autor no puede contener números.
                          El nombre del autor no puede contener caracteres especiales.
                      ''';
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 10,
                        isDense: true,
                        labelText: 'Nombre',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  //Campo de entrada para la nacionalidad del autor
                  TextFormField(
                    //Funcion que setea el cambio de valor
                    //en la variable nacionalidad y solicita renderizado
                    onChanged: (value) => {
                      nacionalidad = value,
                      setState(() {}),
                    },
                    //Funcion de validación del campo
                    validator: (value) {
                      if (value != null && nacionlidadAutorValidacion(value)) {
                        return null;
                      }
                      //Mensaje de error al no pasar la validación
                      return '''
                          La nacionalidad debe tener una longitud mayor a 2 caracteres.
                          La nacionalidad no puede tener caracteres especiales.
                      ''';
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 10,
                        isDense: true,
                        labelText: 'Nacionalidad',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  //Campo de seleccion de la fecha de nacimiento del autor
                  DateTimeFormField(
                    //Funcion de validación del campo
                    validator: (value) {
                      if (value != null) {
                        return null;
                      }
                      //Mensaje de error al no pasar la validación
                      return 'Debe seleccionar una fecha.';
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Fecha Nacimiento',
                    ),
                    //Establecemos como última fecha la actual
                    lastDate: DateTime.now(),
                    //Establecemos como primera fecha el 01/01/1900
                    firstDate: DateTime(1900),
                    initialValue: fechaNacimiento,
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    //Funcion que setea el cambio de valor
                    //en la variable nacionalidad y solicita renderizado
                    onDateSelected: (DateTime value) {
                      fechaNacimiento = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  //Campo de entrada para la nacionalidad del autor
                  TextFormField(
                    //Funcion de validación del campo
                    validator: (value) {
                      if (value != null && biografiaAutorValidacion(value)) {
                        return null;
                      }
                      //Mensaje de error al no pasar la validación
                      return '''
                          La biografía debe tener una longitud mayor a 2 caracteres.
                          La biografía debe tener una longitud menor a 300 caracteres.
                      ''';
                    },
                    //Establecemos la cantidad máxima de líneas
                    maxLines: null,
                    initialValue: 'Biografía...',
                    //Funcion que setea el cambio de valor
                    //en la variable nacionalidad y solicita renderizado
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
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        //Boton de creación del autor
        ElevatedButton(
            //Función que se ejecuta al presionar el boton
            onPressed: () {
              //Creación del dto para crear el autor
              final autorDto = AutorDto(
                  nombre: nombre,
                  fechaNacimiento: fechaNacimiento,
                  nacionalidad: nacionalidad,
                  biografia: biografia);
              //Validacion de los campos del dto
              //Si no pasa la validación no ejecuta
              //la llamada al endpoint
              if (!resumenAutorValidacion(autorDto)) return;
              //Quitamos la pantalla de la navegación
              ref.read(routesProvider).pop();
              //Mostramos un mensaje de dialogo
              showDialog(
                  context: context,
                  //Widget que llama al endpoint para crear el autor
                  builder: (_) => CrearEntidad<AutorDto>(
                        entidad: autorDto,
                        nombreProvider: createAutorProvider,
                        //Mensaje en caso de crear el autor
                        mensajeResult: 'AUTOR CREADO',
                        //Mensaje de error al crear el autor
                        mensajeError: 'ERROR AL CREAR AUTOR',
                      ));
            },
            style: ButtonStyle(
              //Establecemos el estilo del boton en base
              //a la validacion de los campos
              //Si los campos son validos para crear un autor
              //el boton se mostrará púrpura, sino gris
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
            //Texto que muestra el boton
            child: const Text('Agregar autor')),
        //Boton para cerrar pantalla de creación del autor
        ElevatedButton(
            //Funcion que se ejecuta al presionar el boton
            onPressed: () {
              //Quitamos la pantalla de la navegación
              ref.read(routesProvider).pop();
            },
            //Texto que muestra el boton
            child: const Text('Cancelar'))
      ],
    );
  }
}
