import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/controllers/index.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/pages/addValor.page.dart';
import 'package:bibliotech_admin/pages/parametrospages/categoria/repository/categorias.repository.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'addCategoria.page.dart';
import 'editarCategoria.page.dart';
import 'editarValor.page.dart';

class CategoriasIndex extends ConsumerWidget {
  const CategoriasIndex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorias = ref.watch(categoriasProvider);
    var _ = ref.watch(getAllCategoriasProvider);

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
                      builder: (context) => const CategoriaAdd());
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
            child: ref.read(getAllCategoriasProvider).when(
                  skipLoadingOnRefresh: false,
                  data: (_) => ListView.builder(
                    itemCount: categorias.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(categorias[index].nombre,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          ValorAdd(categorias[index].id));
                                                },
                                                child: Text('Agregar valor',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14))),
                                            const SizedBox(width: 10),
                                            ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        CategoriaEditar(
                                                            categorias[index]
                                                                .id),
                                                  );
                                                },
                                                child: Text('Editar categoría',
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
                                        itemCount:
                                            categorias[index].valores.length,
                                        itemBuilder: (_, i) {
                                          return ListTile(
                                            title: Text(
                                                categorias[index]
                                                    .valores[i]
                                                    .nombre,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14)),
                                            trailing: const Icon(Icons.edit),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    ValorEditar(
                                                        categorias[index]
                                                            .valores[i]
                                                            .id),
                                              );
                                            },
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
                  error: (__, _) => Center(
                    child: ElevatedButton(
                      child: const Text('Reintentar cargar categorías'),
                      onPressed: () {
                        ref.invalidate(getAllCategoriasProvider);
                      },
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )),
      ),
    );
  }
}
