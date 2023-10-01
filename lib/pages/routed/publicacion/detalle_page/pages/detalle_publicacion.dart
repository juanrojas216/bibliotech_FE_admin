import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/new_models/index.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/controllers/getPublicacion.controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/controllers/updatePublicacion.controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/widgets/mostrar_usuario.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import '../repository/detallep.repository.dart';
import '../widgets/index.dart';

class DetallePublicacion extends ConsumerWidget {
  final int publicacionId;

  const DetallePublicacion({super.key, required this.publicacionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detallePublicacion = ref.watch(detallePublicacionProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
            onPressed: () => {ref.read(routesProvider).pop()},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        title: AutoSizeText('Detalle de publicacion',
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
                  Text('Guardar cambios'),
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => ModificarEntidad<Publicacion>(
                      entidad: detallePublicacion,
                      nombreProvider: updatePublicacionProvider,
                      mensajeResult: 'PUBLICACIÓN ACTUALIZADA',
                      mensajeError: 'ERROR AL MODIFICAR PUBLICACIÓN'),
                );
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
      body: ref.read(getPublicacionProvider(publicacionId)).when(
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
              ref.invalidate(getPublicacionProvider(publicacionId));
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
