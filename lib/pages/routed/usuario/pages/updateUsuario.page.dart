import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/getDetalleUsuario.controller.dart';
import '../validations/update-usuario.validation.dart';
import '../controllers/deleteUsuarios.controller.dart';
import '../controllers/editarUsuario.controller.dart';
import '../../../../config/router/admin_router.dart';
import '../../../../widgets/eliminar_entidad.dart';
import '../../../../widgets/crear_entidad.dart';
import '../dto/detalle_usuario.dto.dart';

class UsuarioUpdate extends ConsumerStatefulWidget {
  final int idUsuario;

  const UsuarioUpdate({required this.idUsuario, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUsuarioState();
}

class _UpdateUsuarioState extends ConsumerState<UsuarioUpdate> {
  
  DetalleUsuarioDto? detalleUsuario;

  @override
  Widget build(BuildContext context) {

    if (detalleUsuario == null) {
      ref.read(getDetalleUsuarioProvider(widget.idUsuario)).whenData((value) {
        detalleUsuario = value;
      });
    }

    var search = ref.watch(getDetalleUsuarioProvider(widget.idUsuario));

    return AlertDialog(
      title: Text('Modificar usuario',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: search.when(
        data: (_) {
          return SizedBox(
            width: 800,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: detalleUsuario!.nombre,
                      onChanged: (value) => {
                        detalleUsuario!.nombre = value,
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
                      initialValue: detalleUsuario!.apellido,
                      onChanged: (value) => {
                        detalleUsuario!.apellido = value,
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
                      initialValue: detalleUsuario!.password,
                      onChanged: (value) => {
                        detalleUsuario!.password = value,
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
                      initialValue: detalleUsuario!.email,
                      onChanged: (value) => {
                        detalleUsuario!.email = value,
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
                            selected: detalleUsuario!.roles.contains("BILBIOTECARIO"),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario!.roles.contains("BILBIOTECARIO")) {
                                  detalleUsuario!.roles.add("BILBIOTECARIO");
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario!.roles.contains("BILBIOTECARIO")) {
                                  detalleUsuario!.roles
                                      .removeWhere((e) => e == "BILBIOTECARIO");
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
                            selected: detalleUsuario!.roles.contains("USER"),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario!.roles.contains("USER")) {
                                  detalleUsuario!.roles.add("USER");
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario!.roles.contains("USER")) {
                                  detalleUsuario!.roles
                                      .removeWhere((e) => e == "USER");
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
                            selected: detalleUsuario!.roles.contains("SUPERADMIN"),
                            onSelected: (value) {
                              if (value) {
                                if (!detalleUsuario!.roles.contains("SUPERADMIN")) {
                                  detalleUsuario!.roles.add("SUPERADMIN");
                                  setState(() {});
                                }
                                return;
                              } else {
                                if (detalleUsuario!.roles.contains("SUPERADMIN")) {
                                  detalleUsuario!.roles
                                      .removeWhere((e) => e == "SUPERADMIN");
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
        Visibility(
          visible: detalleUsuario != null,
          child: ElevatedButton(
              onPressed: () {
                if (!updateUsuarioValidacion(detalleUsuario)) return;
                ref.read(routesProvider).pop();
                showDialog(
                    context: context,
                    builder: (_) => CrearEntidad<DetalleUsuarioDto?>(
                          entidad: detalleUsuario,
                          nombreProvider: updateUsuarioProvider,
                          mensajeResult: 'USUARIO CREADO',
                          mensajeError: 'ERROR AL MODIFICAR USUARIO',
                        ));
              },
              style: ButtonStyle(
                backgroundColor: updateUsuarioValidacion(detalleUsuario)
                    ? const MaterialStatePropertyAll(Colors.purple)
                    : const MaterialStatePropertyAll(Colors.grey),
              ),
              child: const Text('Modificar usuario')),
        ),
        Visibility(
          visible: detalleUsuario != null,
          child: ElevatedButton(
              onPressed: () {
                if (!updateUsuarioValidacion(detalleUsuario)) return;
                ref.read(routesProvider).pop();
                showDialog(
                    context: context,
                    builder: (_) => EliminarEntidad(
                          nombreProvider:
                              deleteUsuariosProvider(detalleUsuario!.id!),
                          mensajeResult: 'USUARIO ELIMINADO',
                          mensajeError: 'ERROR AL ELIMINAR AUTOR',
                        ));
              },
              child: const Text('Eliminar usuario')),
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
