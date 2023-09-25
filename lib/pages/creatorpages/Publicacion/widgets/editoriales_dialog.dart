import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/editoriales_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertEditorial extends ConsumerWidget {
  const AlertEditorial({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cargarEditoriales = ref.watch(editorialesProvider);
    var listaAEditoriales = ref.watch(filtroEditorialProvider);

    return AlertDialog(
      title: Column(
        children: [
          const Text('Agregar editorial', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
              onChanged: (value) => ref
                  .read(inputEditorialProvider.notifier)
                  .update((_) => value)),
        ],
      ),
      content: cargarEditoriales.when(
        data: (_) => SizedBox(
          height: 200,
          width: 500,
          child: ListView.builder(
              itemBuilder: (context, index) => listaAEditoriales[index],
              itemCount: listaAEditoriales.length),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(editorialesProvider);
                },
                child: Text('Reintentar cargar editoriales',
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
