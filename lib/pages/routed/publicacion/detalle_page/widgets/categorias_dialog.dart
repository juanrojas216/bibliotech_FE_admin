import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../categorias_controller.dart';

class AlertCategoria extends ConsumerWidget {
  const AlertCategoria({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cargarCategorias = ref.watch(categoriasProvider);
    var listaCategoria = ref.watch(filtroCategoriaProvider);

    return AlertDialog(
      title: Column(
        children: [
          const Text('Agregar categoría', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
              onChanged: (value) => ref
                  .read(inputCategoriaProvider.notifier)
                  .update((_) => value)),
        ],
      ),
      content: cargarCategorias.when(
        data: (_) => SizedBox(
          height: 200,
          width: 500,
          child: ListView.builder(
              itemBuilder: (context, index) => listaCategoria[index],
              itemCount: listaCategoria.length),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(categoriasProvider);
                },
                child: Text('Reintentar cargar categorias',
                    style: GoogleFonts.poppins()))),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      actions: [
        ElevatedButton(
            onPressed: () => ref.read(routesProvider).pop(),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
            child: Text('Cancelar', style: GoogleFonts.poppins()))
      ],
    );
  }
}
