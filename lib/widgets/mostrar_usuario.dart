import 'package:bibliotech_admin/config/auth/usuario_controller.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/auth/auth.service.dart';

class MostrarUsuario extends ConsumerWidget {
  const MostrarUsuario({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var _ = ref.watch(usuarioProvider);

    return ref.read(usuarioProvider).when(
        data: (_) => ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person, color: Colors.black,),
                          const SizedBox(height: 5),
                          Text(Auth.name!, style: GoogleFonts.poppins()),
                          Text(Auth.roles!.join(' - '), style: GoogleFonts.poppins()),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              ref.read(routesProvider).pop();
                            },
                            child: const Text('Aceptar'),
                          )
                        ],
                      ),
                    ),
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                ),
              );
            },
            child: Text(Auth.name!.toUpperCase(), style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black,
            ))),
        error: (_, __) => const Text("Error", style: TextStyle(color: Colors.red)),
        loading: () => const CircularProgressIndicator());
  }
}

// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.account_circle,
//                   color: Colors.black,
//                   size: 36,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
                // AutoSizeText(
                //   Auth.name!.toUpperCase(),
                //   style: const TextStyle(color: Colors.black, fontSize: 16),
                // ),
//               ],
//             )