import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategoria extends ConsumerStatefulWidget {
  const AddCategoria({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditorialState();
}

class _AddEditorialState extends ConsumerState<AddCategoria> {
  String nombreCategoria = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva categoria',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: TextFormField(
        onChanged: (value) => {
          nombreCategoria = value,
          setState(() {}),
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: 'Nueva categoria',
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
            border: const OutlineInputBorder()),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(
            onPressed: () {
              if (nombreCategoria.trim().isEmpty) {
                return;
              } else {
                ref.read(routesProvider).pop();
                showDialog(
                    context: context,
                    builder: (_) =>
                        AddCategoriaDialog(Categoria(idCategoria: 1, nombreCategoria: nombreCategoria, valores: [])));
              }
            },
            style: ButtonStyle(
              backgroundColor: (nombreCategoria.trim().isEmpty)
                  ? const MaterialStatePropertyAll(Colors.grey)
                  : const MaterialStatePropertyAll(Colors.purple),
            ),
            child: const Text('Agregar categoria')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}

class AddCategoriaDialog extends ConsumerWidget {
  final Categoria categoria;

  const AddCategoriaDialog(this.categoria, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var addAutor = ref.watch(agregarAutorProvider(autor));

    return AlertDialog(
      title: const Text('Creando categoria'),
      content: DecoratedBox(
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
              Text('Cateoria creada'),
            ],
          ),
        ),
      ),
      // content: addAutor.when(
      //   data: (_) => IgnorePointer(
      //     child: Center(
      //       child: DecoratedBox(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(),
      //           borderRadius: const BorderRadius.all(Radius.circular(5)),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(10),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(Icons.check),
      //               SizedBox(height: 5),
      //               Text('Autor creado'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   error: (_, __) => IgnorePointer(
      //     child: Center(
      //       child: DecoratedBox(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(),
      //           borderRadius: const BorderRadius.all(Radius.circular(5)),
      //         ),
      //         child: const Padding(
      //           padding: EdgeInsets.all(10),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(Icons.error),
      //               SizedBox(height: 5),
      //               Text('No se pudo crear el autor'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   loading: () => const Center(child: CircularProgressIndicator()),
      // ),
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
