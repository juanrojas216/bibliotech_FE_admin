import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/index.dart';
import '../../../../../../widgets/error_mensaje.dart';
import '../../controllers/getAllEdicion.controller.dart';
import '../../repository/publicacion.repository.dart';
import '../../repository/edicion.repository.dart';

class EdicionInput extends ConsumerStatefulWidget {
  final Publicacion publicacion;

  const EdicionInput(this.publicacion, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EdicionInputState();
}

class _EdicionInputState extends ConsumerState<EdicionInput> {
  @override
  Widget build(BuildContext context) {
    // var publicacionDetalle = ref.watch(publicacionProvider);
    var ediciones = ref.watch(getAllEdicionProvider);

    return ediciones.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButton<int>(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              isDense: true,
              isExpanded: true,
              hint: const Text('EDICIÓN'),
              value: widget.publicacion.edicion.id,
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
              items: [
                ...data.map(
                  (e) => DropdownMenuItem(
                    value: e.id,
                    child: Text(
                      e.nombre,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  widget.publicacion.edicion = data.firstWhere((edicion) => edicion.id == value);
                  setState(() {});
                  // ref.read(publicacionProvider.notifier).actualizarEdicion(
                  //     data.where((e) => e.id == value).first);
                }
              },
            ),
          );
        },
        // error: (_, __) => ElevatedButton(
        //       onPressed: () {
        //         ref.invalidate(getAllEdicionProvider);
        //       },
        //       child: Text(
        //         'Reintentar cargar ediciones',
        //         style: GoogleFonts.poppins(),
        //       ),
        //     ),
        error: (response, _) => ErrorResultadoWidget(
              response: response,
              provider: getAllEdicionProvider,
              message: 'Reintentar cargar ediciones',
            ),
        loading: () => const LinearProgressIndicator());
  }
}
