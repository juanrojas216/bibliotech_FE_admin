import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/index_page/widgets/mostrar_usuario.dart';
import '../controllers/index.dart';
import '../services/filterAutores.service.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'addAutor.page.dart';
import 'editarAutor.page.dart';

class AutoresIndex extends ConsumerStatefulWidget {
  const AutoresIndex({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AutoresIndexState();
}

class _AutoresIndexState extends ConsumerState<AutoresIndex> {
  late String filtro;

  @override
  void initState() {
    super.initState();
    filtro = '';
  }

  @override
  Widget build(BuildContext context) {
    final autores = ref.watch(filtroListaAutoresProvider(filtro));
    var _ = ref.watch(getAllAutoresProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Autores',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => const AutorAdd());
                },
                child: const Text('Nuevo autor')),
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
          child: ref.read(getAllAutoresProvider).when(
                skipLoadingOnRefresh: false,
                data: (_) => Column(children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        label: Text('Buscador', style: GoogleFonts.poppins()),
                        border: const OutlineInputBorder()),
                    initialValue: filtro,
                    onChanged: (value) {
                      filtro = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView(
                      children: autores
                          .map((a) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ListTile(
                                    trailing: const Icon(Icons.more_vert),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(a.nombre,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            '${a.fechaNacimiento.day}/${a.fechaNacimiento.month}/${a.fechaNacimiento.year} - ${a.nacionalidad.toUpperCase()}'),
                                        Text(a.biografia),
                                      ],
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AutorEditar(a.id),
                                      );
                                    },
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ]),
                error: (__, _) => Center(
                  child: ElevatedButton(
                    child: const Text('Reintentar cargar autores'),
                    onPressed: () {
                      ref.invalidate(getAllAutoresProvider);
                    },
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
