import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/pages/routed/multa/index_page/pages/parametros_multas.page.dart';
import 'package:bibliotech_admin/widgets/menubutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';

import '../widgets/index.dart';

class MultasIndex extends StatelessWidget {
  const MultasIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuButton(),
        elevation: 0,
        title: AutoSizeText('MULTAS',
            style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: NuevaMulta(),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Parametros'),
                ],
              ),
              onPressed: () {
                // ref.read(routesProvider).push('/publicacion/create');
                showCupertinoDialog(
                  context: context,
                  builder: (_) => const ParametrosMultaPage(),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(width: 240, child: Center(child: MostrarUsuario())),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: const Margin(
        child: Column(
          children: [
            SizedBox(height: 20),
            InputBusquedaMulta(),
            SizedBox(height: 5),
            Resultados(),
          ],
        ),
      ),
    );
  }
}
