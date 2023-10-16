import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/get_detalle_prestamo.controller.dart';

class ResultadoDetallePrestamo extends ConsumerStatefulWidget {
  final int idPrestamo;

  const ResultadoDetallePrestamo({
    required this.idPrestamo,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResultadoDetallePrestamoState();
}

class _ResultadoDetallePrestamoState
    extends ConsumerState<ResultadoDetallePrestamo> {
  @override
  Widget build(BuildContext context) {
    var search = ref.watch(getDetallePrestamoProvider(widget.idPrestamo));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: search.when(
        data: (data) => SizedBox(
          height: 300,
          width: 800,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: data.estado,
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'ESTADO ACTUAL',
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
                      initialValue: data.fechaInicioPrestamo,
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'FECHA INICIO PRÉSTAMO',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: data.fechaFinPrestamo,
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'FECHA FIN PRÉSTAMO',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: data.fechaDevolucion,
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'FECHA DEVOLUCIÓN',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("RENOVACIONES",
                  style: GoogleFonts.poppins(), textAlign: TextAlign.center),
              const Divider(),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: ListView.separated(
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: ListTile(
                              title: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: data.renovaciones[index]
                                          .fechaInicioRenovacion,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'FECHA INICIO',
                                        labelStyle: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppins.toString(),
                                            fontSize: 14),
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: data
                                          .renovaciones[index].fechaFinRenovacion,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'FECHA FIN',
                                        labelStyle: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppins.toString(),
                                            fontSize: 14),
                                        border: const OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemCount: data.renovaciones.length),
                ),
              ),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(getDetallePrestamoProvider);
                },
                child: Text('Reintentar cargar detalle de préstamo',
                    style: GoogleFonts.poppins()))),
        loading: () => const SizedBox(
          height: 1000,
          width: 800,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
