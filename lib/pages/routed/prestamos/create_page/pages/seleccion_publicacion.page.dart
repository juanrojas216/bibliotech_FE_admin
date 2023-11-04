import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../widgets/resultados_publicacion.widget.dart';

class SelectPublicacionPage extends ConsumerStatefulWidget {
  final int idUsuario;

  const SelectPublicacionPage(this.idUsuario, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectPrestamoPageState();
}

class _SelectPrestamoPageState extends ConsumerState<SelectPublicacionPage> {
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
                    "SELECCIONAR PUBLICACIÓN",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Seleccione 1 publicacion haciendo doble click sobre la fila"),
                      const SizedBox(width: 5),
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
              ResultadosPublicacion(widget.idUsuario),
            ],
          ),
        ),
      ),
    );
  }
}
