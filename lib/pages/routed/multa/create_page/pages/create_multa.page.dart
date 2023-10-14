import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../widgets/resultados_crear_multa.widget.dart';

class CreateMultaPage extends ConsumerStatefulWidget {
  final int idUsuario;
  final int idPrestamo;

  const CreateMultaPage(this.idUsuario, this.idPrestamo, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateMultaPageState();
}

class _CreateMultaPageState extends ConsumerState<CreateMultaPage> {
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
                    "CREAR MULTA",
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
              ResultadoCrearMulta(
                idUsuario: widget.idUsuario,
                idPrestamo: widget.idPrestamo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
