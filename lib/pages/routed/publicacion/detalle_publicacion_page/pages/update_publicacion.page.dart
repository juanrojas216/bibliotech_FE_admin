// import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:layout/layout.dart';


// import '../controllers/updatePublicacion.controller.dart';
// import '../../../../../config/router/admin_router.dart';
// import '../controllers/getPublicacion.controller.dart';
// import '../../../../../widgets/mostrar_usuario.dart';
// import '../validations/publicacion.validation.dart';
// import '../../../../../widgets/error_mensaje.dart';
// import '../repository/publicacion.repository.dart';
// import '../dto/editar-publicacion.dto.dart';
// import '../widgets/index.dart';

// class UpdatePublicacionPage extends ConsumerStatefulWidget {
//   final int publicacionId;

//   const UpdatePublicacionPage({required this.publicacionId, super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _CreatePublicacionPageState();
// }

// class _CreatePublicacionPageState extends ConsumerState<UpdatePublicacionPage> {
  
  
//   @override
//   Widget build(BuildContext context) {

//     var getPublicacion = ref.watch(getPublicacionProvider(widget.publicacionId));

//     return Scaffold( 
//       appBar: AppBar(
//         leading: IconButton.filled(
//             onPressed: () => {ref.read(routesProvider).pop()},
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             )),
//         elevation: 0,
//         title: AutoSizeText('Detalle publicacion',
//             style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
//         backgroundColor: Colors.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 var publicacion = ref.read(publicacionProvider);
//                 if (!publicacionValidacion(publicacion)) return;
//                 showDialog(
//                   context: context,
//                   builder: (_) => ModificarEntidad<EditarPublicacionDto>(
//                       entidad: createDtoUpdatePublicaion(publicacion),
//                       nombreProvider: updatePublicacionProvider,
//                       mensajeResult: 'PUBLICACIÓN ACUTALIZADA',
//                       mensajeError: 'ERROR AL ACTUALIZAR PUBLICACIÓN'),
//                 );
//               },
//               style: ButtonStyle(
//                 backgroundColor:
//                     (!publicacionValidacion(ref.read(publicacionProvider)))
//                         ? const MaterialStatePropertyAll(Colors.grey)
//                         : const MaterialStatePropertyAll(Colors.purple),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(Icons.save_alt),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text('Actualizar publicación'),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 20),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Center(child: MostrarUsuario()),
//           ),
//           const SizedBox(width: 20),
//         ],
//       ),
//       body: getPublicacion.when(
//             data: (data) => Margin(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.maxFinite,
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: TituloInput(data),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             flex: 2,
//                             child: IsbnInput(data),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             flex: 1,
//                             child: PagesInput(data),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: double.maxFinite,
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: LinkInput(data),
//                     ),
//                     Container(
//                       width: double.maxFinite,
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Row(
//                         children: [
//                           Expanded(child: EdicionInput(data)),
//                           const SizedBox(width: 10),
//                           Expanded(child: AnioInput(data)),
//                           const SizedBox(width: 10),
//                           Expanded(child: TipoInput(data)),
//                         ],
//                       ),
//                     ),
//                     const CategoriasPublicacion(),
//                     const EditorialesPublicacion(),
//                     const AutoresPublicacion(),
//                   ],
//                 ),
//               ),
//             ),
//             // error: (_, __) => Center(
//             //     child: ElevatedButton(
//             //         onPressed: () {
//             //           ref.invalidate(
//             //               getPublicacionProvider(widget.publicacionId));
//             //         },
//             //         child: Text('Reintentar cargar publicacion',
//             //             style: GoogleFonts.poppins()))),
//             error: (response, _) => ErrorResultadoWidget(
//                   response: response,
//                   provider: getPublicacionProvider(widget.publicacionId),
//                   message: 'Reintentar cargar detalle',
//             ),
//             loading: () => const Center(child: CircularProgressIndicator()),
//           ),
//     );
//   }
// }
