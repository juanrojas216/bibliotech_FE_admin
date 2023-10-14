// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:bibliotech_admin/widgets/menubutton.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:layout/layout.dart';


// class CreatePrestamoIndex extends StatelessWidget {

//   const CreatePrestamoIndex({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const MenuButton(),
//         elevation: 0,
//         title: AutoSizeText('MULTAS',
//             style: GoogleFonts.poppins(color: Colors.black)),
//         backgroundColor: Colors.white,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: NuevaMulta(),
//           ),
//           SizedBox(width: 10),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: SizedBox(width: 240, child: Center(child: MostrarUsuario())),
//           ),
//           SizedBox(width: 20),
//         ],
//       ),
//       body: const Margin(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             InputBusquedaMulta(),
//             SizedBox(height: 5),
//             Resultados(),
//           ],
//         ),
//       ),
//     );
//   }
// }
