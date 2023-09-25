import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/autores_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertAutor extends ConsumerWidget {
  const AlertAutor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cargarAutores = ref.watch(autoresProvider);
    var listaAutores = ref.watch(filtroAutorProvider);

    return AlertDialog(
      title: Column(
        children: [
          const Text('Agregar autor', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
              onChanged: (value) => ref
                  .read(inputAutorProvider.notifier)
                  .update((_) => value)),
        ],
      ),
      content: cargarAutores.when(
        data: (_) => SizedBox(
          height: 200,
          width: 500,
          child: ListView.builder(
              itemBuilder: (context, index) => listaAutores[index],
              itemCount: listaAutores.length),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(autoresProvider);
                },
                child: Text('Reintentar cargar autores',
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
