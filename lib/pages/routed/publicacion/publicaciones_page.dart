import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/widgets/widgets_publicacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import '../../../widgets/menubutton.dart';

class PublicacionesPage extends StatelessWidget {
  const PublicacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuButton(),
        elevation: 0,
        title: AutoSizeText('Publicaciones',
            style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: NuevaPublicacion(),
          ),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ParametrosPopUp(),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: const Margin(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TablaPublicaciones(),
        ),
      ),
    );
  }
}

// class MenuPopUp extends ConsumerStatefulWidget {
//   const MenuPopUp({
//     super.key,
//   });

//   @override
//   State<MenuPopUp> createState() => MenuPopUpState();
// }


// class MenuPopUpState extends ConsumerState<MenuPopUp> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => {_showDialog()},
//       child: const Text("Parámetros"),
//     );
//   }

//   void _showDialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Parámetros"),
//             content: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const EditorialesAbm()),
//                     );
//                   },
//                   label: const Text(
//                     'Ver editoriales',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver ediciones',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver autores',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver categorías',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver ubicaciones',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver tipos de publicación',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver facultades',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 TextButton.icon(
//                   icon: const Icon(Icons.search),
//                   onPressed: () {},
//                   label: const Text(
//                     'Ver carreras',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   style: TextButton.styleFrom(
//                     iconColor: Colors.white,
//                     backgroundColor: Colors.purple,
//                     fixedSize: const Size(250, 40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               OutlinedButton(
//                 child: const Text("Cerrar"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         });
//   }
// }