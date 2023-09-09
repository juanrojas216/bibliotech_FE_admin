import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/tipo_publicacion/tipo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTipoPublicacion extends ConsumerStatefulWidget {
  const AddTipoPublicacion({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTipoPublicacionState();
}

class _AddTipoPublicacionState extends ConsumerState<AddTipoPublicacion> {
  
  String nombreTipo = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo tipo de publicación',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: 'Nombre tipo de publicación',
        onChanged: (value) => {
          nombreTipo = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre tipo de publicación',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (nombreTipo.trim().isEmpty) {
                return;
              } else {
                ref.read(routesProvider).pop();
                showDialog(context: context, builder: (_) => AddTipoPublicacionDialog(nombreTipo));
              }
            },
            style: ButtonStyle(
             backgroundColor:  nombreTipo.trim().isNotEmpty ? const MaterialStatePropertyAll(Colors.purple) : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar tipo')),
        ElevatedButton(
            onPressed: () { ref.read(routesProvider).pop(); },
            child: const Text('Cancelar'))
      ],
    );
  }
}

class AddTipoPublicacionDialog extends ConsumerWidget {

  final String nombreEditorial;


  const AddTipoPublicacionDialog(this.nombreEditorial, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var addEditorial = ref.watch(agregarTipoPublicacionProvider(nombreEditorial));

    return AlertDialog(
      title: const Text('Creando tipo....'),
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
                Text('Tipo publicación creada'),
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
                Text('No se pudo crear el tipo de publicación'),
              ],
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
