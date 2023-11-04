import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/admin_router.dart';
import '../controllers/finalizar_multa.controller.dart';
import '../controllers/get_detalle_multa.controller.dart';

class ResultadoDetalleMulta extends ConsumerStatefulWidget {
  final int idMulta;

  const ResultadoDetalleMulta({
    required this.idMulta,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResultadoDetalleMultaState();
}

class _ResultadoDetalleMultaState extends ConsumerState<ResultadoDetalleMulta> {
  @override
  Widget build(BuildContext context) {
    var search = ref.watch(getDetalleMultaProvider(widget.idMulta));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          skipLoadingOnRefresh: false,
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: data.usuario,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'USUARIO',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        initialValue: data.tipo,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'MOTIVO DE MULTA',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: data.publicacion,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'PUBLICACION',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        initialValue: data.ejemplar,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'EJEMPLAR',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: data.fechaDesde,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'FECHA DESDE',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        initialValue: data.fechaHasta,
                        readOnly: true,
                        decoration: InputDecoration(
                            isDense: true,
                            labelText: 'FECHA HASTA',
                            labelStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins.toString(),
                                fontSize: 14),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TextFormField(
                    initialValue: data.estado,
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'ESTADO',
                        labelStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins.toString(),
                            fontSize: 14),
                        border: const OutlineInputBorder()),
                  ),
                ),
                Visibility(
                  visible: data.estado != "FINALIZADO",
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => EliminarEntidad(
                                  nombreProvider:
                                      finalizarMultaProvider(widget.idMulta),
                                  mensajeResult:
                                      'MULTA FINALIZADA POR EXCEPCIO',
                                  mensajeError: 'ERROR AL FINALIZAR MULTA',
                                ));
                        ref.read(routesProvider).pushReplacement('/multa');
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent),
                      ),
                      child: Text(
                        'CREAR MULTA',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(getDetalleMultaProvider);
                  },
                  child: Text('Reintentar cargar detalle de multa',
                      style: GoogleFonts.poppins()))),
          loading: () => const SizedBox(
            height: 1000,
            width: 800,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
