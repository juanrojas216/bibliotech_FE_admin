import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/categorias/add_categoria.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicacion_page/widgets/mostrar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriasABM extends ConsumerWidget {
  const CategoriasABM({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Categorias',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const AddCategoria());
                },
                child: const Text('Nueva categoria')),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Container(
          height: 100.h,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border.fromBorderSide(
                BorderSide(color: Colors.grey, width: 2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Margin(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Card(
                      shape: Border.all(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nombre categoria',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Agregar valor',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14))),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.redAccent)),
                                        child: Text('Eliminar categoría',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14)))
                                  ],
                                )
                              ],
                            ),
                            const Divider(color: Colors.grey),
                            SizedBox(
                              width: double.maxFinite,
                              height: 200,
                              child: ListView.builder(
                                itemCount: 20,
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text('Valor categoria $index',
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                    trailing: const Icon(Icons.edit),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
