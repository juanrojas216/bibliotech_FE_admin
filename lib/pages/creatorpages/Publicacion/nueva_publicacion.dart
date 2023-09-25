import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/widgets/mostrar_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';

import 'nueva-publicacion.controller.dart';
import 'widgets/widgets_detallep.dart';

class NuevaPublicacionPage extends ConsumerWidget {

  const NuevaPublicacionPage({super.key});

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
        title: AutoSizeText('Nueva publicacion',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              child: const Row(
                children: [
                  Icon(Icons.save_alt),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Crear publicacion'),
                ],
              ),
              onPressed: () {
                ref.invalidate(guardarPublicacionProvider);
                showCupertinoDialog(
                    context: context, builder: (_) => const SavePublicacion());
              },
            ),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
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
                      Expanded(child: PlataformaInput()),
                      SizedBox(width: 10),
                      Expanded(child: LinkInput()),
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
