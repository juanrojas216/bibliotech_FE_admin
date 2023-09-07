import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/models/autor.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/autor_controller.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAutor extends ConsumerStatefulWidget {
  const AddAutor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditorialState();
}

class _AddEditorialState extends ConsumerState<AddAutor> {
  String nombreAutor = '';
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
                    nombreAutor = value,
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
              if (nombreAutor.trim().isEmpty ||
                  fechaNacimiento.isAfter(DateTime.now()) ||
                  nacionalidad.trim().isEmpty ||
                  biografia.trim().isEmpty) {
                return;
              } else {
                ref.read(routesProvider).pop();
                // showDialog(
                //     context: context,
                //     builder: (_) =>
                //         AddAutorDialog(Autor()));
              }
            },
            style: ButtonStyle(
              backgroundColor: (nombreAutor.trim().isEmpty ||
                      fechaNacimiento.isAfter(DateTime.now()) ||
                      nacionalidad.trim().isEmpty ||
                      biografia.trim().isEmpty)
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
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

class AddAutorDialog extends ConsumerWidget {
  final Autor autor;

  const AddAutorDialog(this.autor, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var addAutor = ref.watch(agregarAutorProvider(autor));

    return AlertDialog(
      title: const Text('Creando autor....'),
      content: addAutor.when(
        data: (_) => IgnorePointer(
          child: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    SizedBox(height: 5),
                    Text('Autor creado'),
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (_, __) => IgnorePointer(
          child: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error),
                    SizedBox(height: 5),
                    Text('No se pudo crear el autor'),
                  ],
                ),
              ),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: const Text('Aceptar'),
        )
      ],
    );
  }
}
