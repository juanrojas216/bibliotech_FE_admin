import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../widgets/resultados_detalle_prestamo.widget.dart';

class DetallePrestamoPage extends ConsumerStatefulWidget {
  final int idPrestamo;

  const DetallePrestamoPage(this.idPrestamo, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetallePrestamoPageState();
}

class _DetallePrestamoPageState extends ConsumerState<DetallePrestamoPage> {
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Card(
        shape: Border.all(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DETALLE PRESTAMO",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          ref.read(routesProvider).pop();
                        },
                        child: Text(
                          'VOLVER',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey),

              //TABLA DE RESULTADOS
              ResultadoDetallePrestamo(
                idPrestamo: widget.idPrestamo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
