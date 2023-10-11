import 'package:bibliotech_admin/pages/routed/usuario/controllers/getDetalleUsuario.controller.dart';
import 'package:bibliotech_admin/pages/routed/usuario/validations/usuario.validation.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/router/admin_router.dart';
import '../../../../widgets/crear_entidad.dart';
import '../controllers/deleteUsuarios.controller.dart';
import '../controllers/editarUsuario.controller.dart';
import '../dto/detalleUsuario.dto.dart';

class UsuarioUpdate extends ConsumerStatefulWidget {
  final int idUsuario;

  const UsuarioUpdate({required this.idUsuario, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUsuarioState();
}

class _UpdateUsuarioState extends ConsumerState<UsuarioUpdate> {
  
  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    
    var search = ref.watch(getDetalleUsuarioProvider(widget.idUsuario));

    return AlertDialog(
      title: Text('Modificar usuario',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: search.when(
        data: (detalleUsuario) {          
          return SizedBox(
            width: 800,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => {
                        detalleUsuario.nombre = value,
                        setState(() {}),
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'NOMBRE',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => {
                        detalleUsuario.apellido = value,
                        setState(() {}),
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'APELLIDO',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => {
                        detalleUsuario.password = value,
                        setState(() {}),
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => {
                        detalleUsuario.email = value,
                        setState(() {}),
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const Text('Roles', textAlign: TextAlign.center),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("BILBIOTECARIO"),
                            selectedColor:
                                const Color.fromARGB(255, 214, 137, 228),
                            disabledColor: Colors.grey,
                            selected: detalleUsuario.roles.contains(3),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario.roles.contains(3)) {
                                  detalleUsuario.roles.add(3);
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario.roles.contains(3)) {
                                  detalleUsuario.roles
                                      .removeWhere((e) => e == 3);
                                  setState(() {});
                                }
                                return;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("USER"),
                            selectedColor:
                                const Color.fromARGB(255, 214, 137, 228),
                            disabledColor: Colors.grey,
                            selected: detalleUsuario.roles.contains(2),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario.roles.contains(2)) {
                                  detalleUsuario.roles.add(2);
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario.roles.contains(2)) {
                                  detalleUsuario.roles
                                      .removeWhere((e) => e == 2);
                                  setState(() {});
                                }
                                return;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("SUPERADMIN"),
                            selectedColor:
                                const Color.fromARGB(255, 214, 137, 228),
                            disabledColor: Colors.grey,
                            selected: detalleUsuario.roles.contains(1),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario.roles.contains(1)) {
                                  detalleUsuario.roles.add(1);
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario.roles.contains(1)) {
                                  detalleUsuario.roles
                                      .removeWhere((e) => e == 1);
                                  setState(() {});
                                }
                                return;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(getDetalleUsuarioProvider(widget.idUsuario));
                },
                child: Text('Reintentar cargar detalle de usuario',
                    style: GoogleFonts.poppins()))),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        // ElevatedButton(
        //     onPressed: () {
        //       if (!usuarioValidacion(data)) return;
        //       ref.read(routesProvider).pop();
        //       showDialog(
        //           context: context,
        //           builder: (_) => CrearEntidad<DetalleUsuarioDto>(
        //                 entidad: detalleUsuario,
        //                 nombreProvider: updateUsuarioProvider,
        //                 mensajeResult: 'USUARIO CREADO',
        //                 mensajeError: 'ERROR AL MODIFICAR USUARIO',
        //               ));
        //     },
            // style: ButtonStyle(
            //   backgroundColor: resumenAutorValidacion(
            //     AutorDto(
            //         nombre: nombre,
            //         fechaNacimiento: fechaNacimiento,
            //         nacionalidad: nacionalidad,
            //         biografia: biografia),
            //   )
            //       ? const MaterialStatePropertyAll(Colors.purple)
            //       : const MaterialStatePropertyAll(Colors.grey),
            // ),
            // child: const Text('Modificar usuario')),
        // ElevatedButton(
        //     onPressed: () {
        //       // if (!resumenAutorValidacion(autorDto)) return;
        //       ref.read(routesProvider).pop();
        //       showDialog(
        //           context: context,
        //           builder: (_) => EliminarEntidad(
        //                 nombreProvider:
        //                     deleteUsuariosProvider(detalleUsuario.id!),
        //                 mensajeResult: 'USUARIO ELIMINADO',
        //                 mensajeError: 'ERROR AL ELIMINAR AUTOR',
        //               ));
        //     },
        //     child: const Text('Eliminar usuario')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
