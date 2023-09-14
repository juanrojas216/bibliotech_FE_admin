import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/add_edicion.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicacion_page/widgets/mostrar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'edicion_controller.dart';
import 'editar_edicion.dart';

class EdicionesAbm extends ConsumerStatefulWidget {
  const EdicionesAbm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EdiciondesABMState();
}

class _EdiciondesABMState extends ConsumerState<EdicionesAbm> {
  late String filtro;

  @override
  void initState() {
    super.initState();
    filtro = '';
  }

  @override
  Widget build(BuildContext context) {
    var edicionesGet = ref.watch(edicionesABMProvider);
    var ediciones = ref.watch(filtroEdicionProvider(filtro));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Ediciones',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const AddEdicion());
                },
                child: const Text('Nueva editorial')),
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
          child: edicionesGet.when(
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
                  // ref
                  //     .read(inputEdicionABMProvider.notifier)
                  //     .update((_) => value);
                },
              ),
              const SizedBox(height: 10),
              Flexible(
                child: ListView(
                  children: ediciones
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
                                    builder: (_) => EditarEdicion(e.id),
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
                child: const Text('Reintentar cargar editoriales'),
                onPressed: () {
                  ref.invalidate(edicionesABMProvider);
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

// class EdicionesAbm extends ConsumerWidget {
//   const EdicionesAbm({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var edicionesGet = ref.watch(edicionesABMProvider);
//     var ediciones = ref.watch(filtroEdicionProvider);

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               ref.read(routesProvider).pop();
//             },
//             icon: const Icon(Icons.arrow_back),
//             color: Colors.black),
//         elevation: 0,
//         title: AutoSizeText('Ediciones',
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
//         backgroundColor: Colors.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (context) => const AddEdicion());
//                 },
//                 child: const Text('Nueva editorial')),
//           ),
//           const SizedBox(width: 20),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Center(child: MostrarUsuario()),
//           ),
//           const SizedBox(width: 20),
//         ],
//       ),
//       body: Center(
//         child: Container(
//           height: 100.h,
//           padding: const EdgeInsets.all(20),
//           margin: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: const Border.fromBorderSide(
//                 BorderSide(color: Colors.grey, width: 2)),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: edicionesGet.when(
//             skipLoadingOnRefresh: false,
//             data: (_) => Column(children: [
//               const SizedBox(height: 10),
//               CupertinoSearchTextField(
//                 onChanged: (value) {
//                   ref
//                       .read(inputEdicionABMProvider.notifier)
//                       .update((_) => value);
//                 },
//               ),
//               const SizedBox(height: 10),
//               Flexible(
//                 child: ListView(
//                   children: ediciones
//                       .map((e) => Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             child: DecoratedBox(
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(16)),
//                               child: ListTile(
//                                 trailing: const Icon(Icons.more_vert),
//                                 title: Text(e.nombre),
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (_) => EditarEdicion(e.id),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                 ),
//               )
//             ]),
//             error: (__, _) => Center(
//               child: ElevatedButton(
//                 child: const Text('Reintentar cargar editoriales'),
//                 onPressed: () {
//                   ref.invalidate(edicionesABMProvider);
//                 },
//               ),
//             ),
//             loading: () => const Center(child: CircularProgressIndicator()),
//           ),
//         ),
//       ),
//     );
//   }
// }
