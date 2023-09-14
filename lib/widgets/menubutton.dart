import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// class MenuButton extends ConsumerWidget {
//   const MenuButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return IconButton(
//         onPressed: () => {
//               showCupertinoDialog(
//                 context: context,
//                 builder: (_) => SizedBox(
//                   width: 100,
//                   height: 100,
//                   child: CupertinoAlertDialog(
//                     title: Text("MENÚ",
//                         style:
//                             GoogleFonts.poppins(fontWeight: FontWeight.normal)),
//                     actions: <Widget>[
//                       CupertinoDialogAction(
//                         child:
//                             Text('Publicacion', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         child: Text('Prestamo', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/prestamo');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         child: Text('Multa', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/multa');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         child: Text('Usuario', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/usuario');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         child: Text('Reporte', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/reporte');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         child: Text('Cerrar sesion',
//                             style: GoogleFonts.poppins(color: Colors.black)),
//                         onPressed: () {
//                           ref.read(routesProvider).pushReplacement('/');
//                         },
//                       ),
//                       CupertinoDialogAction(
//                         isDestructiveAction: true,
//                         child: Text('Cancelar', style: GoogleFonts.poppins()),
//                         onPressed: () {
//                           ref.read(routesProvider).pop();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             },
//         icon: const Icon(
//           Icons.menu,
//           color: Colors.purple,
//         ));
//   }
// }

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () => {
              showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("MENÚ",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.poppins(fontWeight: FontWeight.normal)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoListTile(
                        leading: const Icon(Icons.file_copy),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title:
                            Text('Publicacion', style: GoogleFonts.poppins()),
                        onTap: () {
                          ref.read(routesProvider).pushReplacement('/publicacion');
                        },
                      ),
                      CupertinoListTile(
                        leading: const Icon(Icons.handshake),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: Text('Prestamo', style: GoogleFonts.poppins()),
                        onTap: () {
                          ref
                              .read(routesProvider)
                              .pushReplacement('/prestamo');
                        },
                      ),
                      CupertinoListTile(
                        leading: const Icon(Icons.dangerous),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: Text('Multa', style: GoogleFonts.poppins()),
                        onTap: () {
                          ref.read(routesProvider).pushReplacement('/multa');
                        },
                      ),
                      CupertinoListTile(
                        leading: const Icon(Icons.account_circle),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: Text('Usuario', style: GoogleFonts.poppins()),
                        onTap: () {
                          ref
                              .read(routesProvider)
                              .pushReplacement('/usuario');
                        },
                      ),
                      CupertinoListTile(
                        leading: const Icon(Icons.data_thresholding_outlined),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: Text('Reporte', style: GoogleFonts.poppins()),
                        onTap: () {
                          ref
                              .read(routesProvider)
                              .pushReplacement('/reporte');
                        },
                      ),
                      CupertinoListTile(
                        leading: const Icon(Icons.login_outlined),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        title: Text('Cerrar sesion',
                            style: GoogleFonts.poppins(color: Colors.black)),
                        onTap: () {
                          ref.read(routesProvider).pushReplacement('/');
                        },
                      ),
                    ],
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                        child: Text('Cancelar', style: GoogleFonts.poppins()),
                        onPressed: () {
                          ref.read(routesProvider).pop();
                        },
                      ),
                  ],
                ),
              ),
            },
        icon: const Icon(
          Icons.menu,
          color: Colors.purple,
        ));
  }
}
