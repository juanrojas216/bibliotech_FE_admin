
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../controllers/getAllAutor.controller.dart';
// import '../../repository/publicacion.repository.dart';
// import 'autores_dialog.dart';


// class AutoresPublicacion extends ConsumerWidget {
  
//   const AutoresPublicacion({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
  
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Text('AUTORES', style: GoogleFonts.poppins()),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   ref.invalidate(getAllAutoresProvider);
//                   showCupertinoDialog(
//                     context: context,
//                     builder: (_) => const AlertAutor(),
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
//             child: AutorItem(),
//           ),
//         ),
//       ],
//     );
//   }
// }


// class AutorItem extends ConsumerStatefulWidget {
  
//   const AutorItem({
//     super.key,
//   });

//   @override
//   FiltroItemAutorState createState() => FiltroItemAutorState();
// }

// class FiltroItemAutorState extends ConsumerState<AutorItem> {
  
//   @override
//   Widget build(BuildContext context) {
    
//     var autores = ref.watch(publicacionProvider).autores;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Wrap(
//           spacing: 5,
//           runSpacing: 5,
//           children: List.generate(
//             autores.length,
//             (index) => FilterChip(
//               avatar: const Icon(Icons.delete),
//               label: Text(autores[index].nombre),
//               onSelected: (_) {
//                 ref.read(publicacionProvider.notifier).deleteAutor(index);
//                 setState(() {});
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }