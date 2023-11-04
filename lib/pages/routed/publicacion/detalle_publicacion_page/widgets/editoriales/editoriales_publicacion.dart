
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../controllers/getAllEditorial.controller.dart';
// import '../../repository/publicacion.repository.dart';
// import 'editoriales_dialog.dart';

// class EditorialesPublicacion extends ConsumerWidget {
//   const EditorialesPublicacion({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
  
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Text('EDITORIALES', style: GoogleFonts.poppins()),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   ref.invalidate(getAllEditorialProvider);
//                   showCupertinoDialog(
//                     context: context,
//                     builder: (_) => const AlertEditorial(),
//                   );
//                 },
//                 child: Text('MODIFICAR', style: GoogleFonts.poppins()),
//               )
//           ],
//         ),
//         Container(
//           width: double.maxFinite,
//           height: 100,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
//           child: const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: EditorialItem(),
//           ),
//         ),
//       ],
//     );
//   }
// }


// class EditorialItem extends ConsumerStatefulWidget {
  
//   const EditorialItem({
//     super.key,
//   });

//   @override
//   FiltroItemEditorialState createState() => FiltroItemEditorialState();
// }

// class FiltroItemEditorialState extends ConsumerState<EditorialItem> {
  
//   @override
//   Widget build(BuildContext context) {
    
//     var editoriales = ref.watch(publicacionProvider).editoriales;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Wrap(
//           spacing: 5,
//           runSpacing: 5,
//           children: List.generate(
//             editoriales.length,
//             (index) => FilterChip(
//               avatar: const Icon(Icons.delete),
//               label: Text(editoriales[index].nombre),
//               onSelected: (_) {
//                 ref.read(publicacionProvider.notifier).deleteEditorial(index);
//                 setState(() {});
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }