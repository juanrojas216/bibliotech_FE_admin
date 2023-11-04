// import 'package:bibliotech_admin/config/router/admin_router.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../widgets/error_mensaje.dart';
// import '../../controllers/getAllCategoria.controller.dart';
// import '../../repository/publicacion.repository.dart';
// import '../../services/filtrarCategoria.service.dart';
// import '../../repository/categorias.repository.dart';

// class AlertCategoria extends ConsumerStatefulWidget {
//   const AlertCategoria({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AlertCategoriaState();
// }

// class _AlertCategoriaState extends ConsumerState<AlertCategoria> {
//   String filtro = '';

//   @override
//   Widget build(BuildContext context) {
//     // var listaCategoria = ref.watch(categoriasProvider);
//     var search = ref.watch(getAllCategoriasProvider);

//     return AlertDialog(
//       title: Column(
//         children: [
//           const Text('Agregar categoría', textAlign: TextAlign.center),
//           const SizedBox(height: 10),
//           CupertinoSearchTextField(
//             onChanged: (value) {
//               filtro = value;
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//       content: search.when(
//             data: (listaCategoria) {
              
//               List<ListTile> items = [];

//               for (var c in filtrarCategorias(filtro, listaCategoria)) {
//                 items.add(ListTile(
//                     title: Text(c.nombre,
//                         style:
//                             GoogleFonts.poppins(fontWeight: FontWeight.bold))));
//                 for (var v in c.valores) {
//                   items.add(ListTile(
//                     title: Text(v.nombre, style: GoogleFonts.poppins()),
//                     trailing: const Icon(Icons.add),
//                     onTap: () {
//                       ref
//                           .read(publicacionProvider.notifier)
//                           .addCategoria(c, v);
//                       ref.read(routesProvider).pop();
//                     },
//                   ));
//                 }
//               }

//               return SizedBox(
//                 height: 200,
//                 width: 500,
//                 child: ListView.builder(
//                     itemBuilder: (context, index) => items[index],
//                     itemCount: items.length),
//               );
//             },
//             // error: (error, stackTrace) => Center(
//             //     child: ElevatedButton(
//             //         onPressed: () {
//             //           ref.invalidate(categoriasProvider);
//             //         },
//             //         child: Text('Reintentar cargar categorias',
//             //             style: GoogleFonts.poppins()))),
//             error: (response, _) => ErrorResultadoWidget(
//                   response: response,
//                   provider: getAllCategoriasProvider,
//                   message: 'Reintentar cargar categorias',
//             ),
//             loading: () => const Center(child: CircularProgressIndicator()),
//           ),
//       actions: [
//         ElevatedButton(
//             onPressed: () => ref.read(routesProvider).pop(),
//             style: const ButtonStyle(
//                 backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
//             child: Text('Cancelar', style: GoogleFonts.poppins()))
//       ],
//     );
//   }
// }
