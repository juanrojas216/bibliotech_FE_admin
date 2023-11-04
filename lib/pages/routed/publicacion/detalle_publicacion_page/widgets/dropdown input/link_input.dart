// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../models/index.dart';
// import '../../../../../../widgets/error_mensaje.dart';
// import '../../controllers/getAllPlataforma.controller.dart';
// import '../../repository/plataformas.repository.dart';
// import '../../repository/publicacion.repository.dart';

// class LinkInput extends ConsumerStatefulWidget {
//   final Publicacion publicacion;

//   const LinkInput(this.publicacion, {super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LinkInputState();
// }

// class _LinkInputState extends ConsumerState<LinkInput> {
//   @override
//   Widget build(BuildContext context) {
//     // var publicacion = ref.watch(publicacionProvider);
//     var tipos = ref.watch(getAllPlataformasProvider);

//     return tipos.when(
//         skipLoadingOnRefresh: false,
//         data: (data) => Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(publicacionProvider.notifier).resetearLink();
//                   },
//                   child: Text('Eliminar link', style: GoogleFonts.poppins()),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: DropdownButton<int>(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 11),
//                       isDense: true,
//                       isExpanded: true,
//                       hint: const Text('PLATAFORMA'),
//                       value: widget.publicacion.link.plataforma?.id,
//                       style: TextStyle(
//                           fontFamily: GoogleFonts.poppins.toString(),
//                           fontSize: 14),
//                       items: data
//                           .map(
//                             (e) => DropdownMenuItem(
//                               value: e.id,
//                               child: Text(e.nombre),
//                             ),
//                           )
//                           .toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           widget.publicacion.link.plataforma = data.firstWhere(
//                               (plataforma) => plataforma.id == value);
//                           setState(() {});
//                           // ref
//                           //     .read(publicacionProvider.notifier)
//                           //     .actualizarLinkPlataforma(data.firstWhere((p) => p.id == value));
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextFormField(
//                     initialValue: widget.publicacion.link.url,
//                     onChanged: (value) => widget.publicacion.link.url = value,
//                     // ref
//                     //     .read(publicacionProvider.notifier)
//                     //     .actualizarLinkUrl(value),
//                     decoration: InputDecoration(
//                       isDense: true,
//                       labelText: 'LINK',
//                       labelStyle: TextStyle(
//                           fontFamily: GoogleFonts.poppins.toString(),
//                           fontSize: 14),
//                       border: const OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: DropdownButton<String>(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 11),
//                       isDense: true,
//                       isExpanded: true,
//                       hint: const Text('ESTADO'),
//                       value: widget.publicacion.link.estado,
//                       style: TextStyle(
//                           fontFamily: GoogleFonts.poppins.toString(),
//                           fontSize: 14),
//                       items: const [
//                         DropdownMenuItem(
//                             value: 'ACTIVO', child: Text('ACTIVO')),
//                         DropdownMenuItem(
//                             value: 'INACTIVO', child: Text('INACTIVO')),
//                       ],
//                       onChanged: (value) {
//                         if (value != null) {
//                           widget.publicacion.link.estado = value;
//                           setState(() {});
//                           // ref
//                           //     .read(publicacionProvider.notifier)
//                           //     .actualizarLinkEstado(value);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//         // error: (_, __) => ElevatedButton(
//         //       onPressed: () {
//         //         ref.invalidate(getAllPlataformasProvider);
//         //       },
//         //       child: Text(
//         //         'Reintentar cargar plataformas',
//         //         style: GoogleFonts.poppins(),
//         //       ),
//         //     ),
//         error: (response, _) => ErrorResultadoWidget(
//               response: response,
//               provider: getAllPlataformasProvider,
//               message: 'Reintentar cargar plataformas',
//             ),
//         loading: () => const LinearProgressIndicator());
//   }
// }
