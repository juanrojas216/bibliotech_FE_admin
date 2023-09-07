import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/editorial/editorial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditorial extends ConsumerStatefulWidget {
  const AddEditorial({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditorialState();
}

class _AddEditorialState extends ConsumerState<AddEditorial> {
  
  String nombreEditorial = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva editorial',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        initialValue: 'Nombre editorial',
        onChanged: (value) => {
          nombreEditorial = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nombre Editorial',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (nombreEditorial.trim().isEmpty) {
                return;
              } else {
                ref.read(routesProvider).pop();
                showDialog(context: context, builder: (_) => AddEditorialDialog(nombreEditorial));
              }
            },
            style: ButtonStyle(
             backgroundColor:  nombreEditorial.trim().isNotEmpty ? const MaterialStatePropertyAll(Colors.purple) : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar editorial')),
        ElevatedButton(
            onPressed: () { ref.read(routesProvider).pop(); },
            child: const Text('Cancelar'))
      ],
    );
  }
}

class AddEditorialDialog extends ConsumerWidget {

  final String nombreEditorial;


  const AddEditorialDialog(this.nombreEditorial, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var addEditorial = ref.watch(agregarEditorialProvider(nombreEditorial));

    return AlertDialog(
      title: const Text('Creando editorial....'),
      content: addEditorial.when(
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
                    Text('Editorial creada'),
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
                    Text('No se pudo crear la editorial'),
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
