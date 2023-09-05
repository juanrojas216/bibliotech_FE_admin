import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';

import 'widgets/widgets_detallep.dart';

class DetallePublicacion extends ConsumerWidget {
  final int publicacionId;

  const DetallePublicacion({super.key, required this.publicacionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detallePublicacionRequest =
        ref.watch(detallePublicacionRequestProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
            onPressed: () => {ref.read(routesProvider).pop()},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        title: AutoSizeText('Sr. PEPE EL GRILLO',
            style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: AutoSizeText('Detalle de publicacion',
                  style:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
            ),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              child: const Row(
                children: [
                  Icon(Icons.save_alt),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Guardar cambios'),
                ],
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: detallePublicacionRequest.when(
        skipLoadingOnRefresh: false,
        data: (_) => Margin(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Expanded(child: TituloInput()),
                      SizedBox(width: 10),
                      Expanded(child: IsbnInput()),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Expanded(child: EdicionInput()),
                      SizedBox(width: 10),
                      Expanded(child: AnioInput()),
                      SizedBox(width: 10),
                      Expanded(child: TipoInput()),
                    ],
                  ),
                ),
                const CategoriasPublicacion(),
                const EditorialesPublicacion(),
                const AutoresPublicacion(),
              ],
            ),
          ),
        ),
        error: (_, __) => Center(
          child: ElevatedButton(
            onPressed: () {
              ref.invalidate(detallePublicacionRequestProvider);
            },
            child: Text(
              'Reintentar cargar detalle',
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
