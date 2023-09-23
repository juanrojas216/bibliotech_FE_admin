import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/auth/logged_in_state_info.dart';

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
                builder: (_) => SizedBox(
                  width: 100,
                  height: 100,
                  child: AlertDialog(
                    title: Text("MENÚ",
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.normal)),
                    content: Column(
                      children: [
                        CupertinoDialogAction(
                          child:
                              Text('Publicacion', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref.read(routesProvider).pushReplacement('/');
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Prestamo', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .pushReplacement('/prestamo');
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Multa', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref.read(routesProvider).pushReplacement('/multa');
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Usuario', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .pushReplacement('/usuario');
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Reporte', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .pushReplacement('/reporte');
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Cerrar sesion',
                              style: GoogleFonts.poppins(color: Colors.black)),
                          onPressed: () {
                            storage.delete(key: 'jwt');
                            ref.read(loggedInProvider.notifier).state = false;
                            ref.read(routesProvider).pushReplacement('/');
                          },
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: Text('Cancelar', style: GoogleFonts.poppins()),
                          onPressed: () {
                            ref.read(routesProvider).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            },
        icon: const Icon(
          Icons.menu,
          color: Colors.purple,
        ));
  }
}
