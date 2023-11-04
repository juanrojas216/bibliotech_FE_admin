import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/services/filterEdiciones.service.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/error_mensaje.dart';
import '../controllers/index.dart';
import 'addCarrera.page.dart';
import 'editarCarrera.page.dart';


class CarrerasIndex extends ConsumerStatefulWidget {
  
  const CarrerasIndex({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarrerasABMState();
}

class _CarrerasABMState extends ConsumerState<CarrerasIndex> {
  
  late String filtro;

  @override
  void initState() {
    super.initState();
    filtro = '';
  }

  @override
  Widget build(BuildContext context) {
    
    var carreras = ref.watch(filtroEdicionesProvider(filtro));
    var _ = ref.watch(getAllCarreraProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Carreras',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const CarreraAdd());
                },
                child: const Text('Nueva carrera')),
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
          child: ref.read(getAllCarreraProvider).when(
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
                  children: carreras
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                trailing: const Icon(Icons.more_vert),
                                title: Text(e.nombre),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => CarreraEditar(e.id),
                                  );
                                },
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ]),
            // error: (__, _) => Center(
            //   child: ElevatedButton(
            //     child: const Text('Reintentar cargar carreras'),
            //     onPressed: () {
            //       ref.invalidate(getAllCarreraProvider);
            //     },
            //   ),
            // ),
            error: (response, _) => ErrorResultadoWidget(
                  response: response,
                  provider: getAllCarreraProvider,
                  message: 'Reintentar cargar carreras',
              ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}