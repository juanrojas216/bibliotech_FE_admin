import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';

import '../widgets/parametros_popup.dart';
import 'create_parametro.page.dart';

class ParametrosMultaPage extends ConsumerStatefulWidget {
  const ParametrosMultaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ParametrosMultaPageState();
}

class _ParametrosMultaPageState extends ConsumerState<ParametrosMultaPage> {
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
                    "PARAMETROS MULTA",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purple),
                        ),
                        onPressed: () async {
                          await showCupertinoDialog(
                              context: context,
                              builder: (context) => const CreateParametroMultaPage());
                        },
                        child: Text(
                          'CREAR PARAMETRO',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 10),
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

              //LISTA DE PARAMETROS
              const ParametrosMulta(),
            ],
          ),
        ),
      ),
    );
  }
}
