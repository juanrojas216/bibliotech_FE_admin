import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/edicion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEdicion extends ConsumerStatefulWidget {
  const AddEdicion({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEdicionState();
}

class _AddEdicionState extends ConsumerState<AddEdicion> {
  
  String nombreEdicion = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva edicion',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: '',
        onChanged: (value) => {
          nombreEdicion = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre edicion',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (nombreEdicion.trim().isEmpty) {
                return;
              } else {
                ref.read(routesProvider).pop();
                showDialog(context: context, builder: (_) => AddEdicionDialog(nombreEdicion));
              }
            },
            style: ButtonStyle(
             backgroundColor:  nombreEdicion.trim().isNotEmpty ? const MaterialStatePropertyAll(Colors.purple) : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar edicion')),
        ElevatedButton(
            onPressed: () { ref.read(routesProvider).pop(); },
            child: const Text('Cancelar'))
      ],
    );
  }
}

class AddEdicionDialog extends ConsumerWidget {

  final String nombreEdicion;


  const AddEdicionDialog(this.nombreEdicion, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var addEditorial = ref.watch(agregarEdicionProvider(nombreEdicion));

    return AlertDialog(
      title: const Text('Creando edicion....'),
      content: addEditorial.when(
        data: (_) => DecoratedBox(
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
                Text('Edicion creada'),
              ],
            ),
          ),
        ),
        error: (_, __) => DecoratedBox(
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
                Text('No se pudo crear la edicion'),
              ],
            ),
          ),
        ),
        loading: () => const CircularProgressIndicator(),
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
