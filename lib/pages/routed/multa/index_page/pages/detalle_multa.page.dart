import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../widgets/resultados_detalle_multa.widget.dart';

class DetalleMultaPage extends ConsumerStatefulWidget {
  final int idMulta;

  const DetalleMultaPage(this.idMulta, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetalleMultaPageState();
}

class _DetalleMultaPageState extends ConsumerState<DetalleMultaPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Card(
        shape: Border.all(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DETALLE MULTA",
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
              ResultadoDetalleMulta(
                idMulta: widget.idMulta,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
