import 'dart:js_interop';

import 'package:bibliotech_admin/widgets/crear_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/crearRol.controller.dart';
import '../controllers/getEntitesAndActiones.controller.dart';
import '../controllers/getRoles.controller.dart';
import '../dto/roles_usuario.dto.dart';
import '../validations/rol.validation.dart';

class CrearRolUsuario extends ConsumerStatefulWidget {
  const CrearRolUsuario({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CrearRolUsuarioState();
}

class _CrearRolUsuarioState extends ConsumerState<CrearRolUsuario> {
  
  String? nombreRol;
  int? entidad;

  @override
  Widget build(BuildContext context) {
    
    // var searh = ref.watch(getEntitiesAndActionsProvider);

    var search = ref.watch(getEntitiesAndActionsProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                shape: Border.all(color: Colors.grey),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: nombreRol,
                              onChanged: (value) => {
                                nombreRol = value,
                                setState(() {}),
                              },
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'NOMBRE ROL',
                                  labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins.toString(),
                                      fontSize: 14),
                                  border: const OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: DropdownButton<int>(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 11),
                                isDense: true,
                                isExpanded: true,
                                hint: const Text('ENTIDAD'),
                                value: entidad.isNull ? null : entidad,
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins.toString(),
                                    fontSize: 14),
                                items: [
                                  ...data["resources"].map(
                                    (e) => DropdownMenuItem<int>(
                                      value: e.idEntidad,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    entidad = data["resources"].firstWhere(
                                        (e) => e.id == value);
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // ElevatedButton(
                          //     style: ButtonStyle(
                          //         backgroundColor: rolValidacion(entidad, nombreRol, data["privilegios"])
                          //             ? const MaterialStatePropertyAll(
                          //                 Colors.purple)
                          //             : const MaterialStatePropertyAll(
                          //                 Colors.grey)),
                          //     onPressed: () {
                          //       if (!rolValidacion(entidad, nombreRol, data["privilegios"])) return;
                          //       showDialog(
                          //           context: context,
                          //           builder: (context) => CrearEntidad<
                          //                   CreateRol>(
                          //               entidad: CreateRol(
                          //                   nombreRol: nombreRol!,
                          //                   entidad: entidad!,
                          //                   privilegios: data["privilegios"]),
                          //               nombreProvider: crearRolProvider,
                          //               mensajeResult: "ROL CREADO CON ÉXITO",
                          //               mensajeError: "ERROR AL CREAR ROL"));
                          //     },
                          //     child: Text('CREAR ROL',
                          //         style: GoogleFonts.poppins(fontSize: 14))),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const Divider(color: Colors.grey),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: data["actions"].length,
                          itemBuilder: (_, i) {
                            return SwitchListTile(
                              value: data["actions"][i]["active"],
                              title: Text(
                                data["actions"][i]["accion"],
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                              onChanged: (value) {
                                data["privilegios"][i]["active"] = value;
                                setState(() {});
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(getRolesUsuarioProvider);
                  },
                  child: Text('Reintentar entidades y privilegios roles',
                      style: GoogleFonts.poppins()))),
          loading: () => const SizedBox(
            height: 1000,
            width: 800,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
