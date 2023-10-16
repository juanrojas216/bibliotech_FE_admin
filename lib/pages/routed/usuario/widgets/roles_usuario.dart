import 'package:bibliotech_admin/pages/routed/usuario/controllers/getRoles.controller.dart';
import 'package:bibliotech_admin/pages/routed/usuario/validations/rol.validation.dart';
import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/editarRol.controller copy.dart';
import '../dto/roles_usuario.dto.dart';

class RolesUsuario extends ConsumerStatefulWidget {
  const RolesUsuario({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RolesUsuarioState();
}

class _RolesUsuarioState extends ConsumerState<RolesUsuario> {
  @override
  Widget build(BuildContext context) {
    var search = ref.watch(getRolesUsuarioProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: ListView.builder(
              itemCount: data["roles"].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    shape: Border.all(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: data["roles"][index].nombreRol,
                                  onChanged: (value) => {
                                    data["roles"][index].nombreRol = value,
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
                                    value:
                                        data["roles"][index].entidad.idEntidad,
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins.toString(),
                                        fontSize: 14),
                                    items: [
                                      ...data["entidades"].map(
                                        (e) => DropdownMenuItem<int>(
                                          value: e.idEntidad,
                                          child: Text(
                                            e.nombreEntidad,
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      if (value != null) {
                                        data["roles"][index].entidad =
                                            data["entidades"].firstWhere(
                                                (e) => e.idEntidad == value);
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: rolValidacion(
                                              data["roles"][index].entidad,
                                              data["roles"][index].nombreRol,
                                              data["roles"][index].privilegios)
                                          ? const MaterialStatePropertyAll(
                                              Colors.purple)
                                          : const MaterialStatePropertyAll(
                                              Colors.grey)),
                                  onPressed: () {
                                    if (!rolValidacion(
                                        data["roles"][index].entidad,
                                        data["roles"][index].nombreRol,
                                        data["roles"][index].privilegios)) return;

                                    showDialog(
                                        context: context,
                                        builder: (context) => ModificarEntidad<
                                                RolUsuarioDto>(
                                            entidad: data["roles"][index],
                                            nombreProvider: updateRolProvider,
                                            mensajeResult: "ROL MODIFICADO",
                                            mensajeError:
                                                "NO SE PUDO MODIFICAR EL ROL"));
                                  },
                                  child: Text('GUARDAR CAMBIOS',
                                      style:
                                          GoogleFonts.poppins(fontSize: 14))),
                              const SizedBox(width: 10),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount:
                                  data["roles"][index].privilegios.length,
                              itemBuilder: (_, i) {
                                return SwitchListTile(
                                  value: data["roles"][index]
                                      .privilegios[i]
                                      .activo,
                                  title: Text(
                                    data["roles"][index].privilegios[i].nombre,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  onChanged: (value) {
                                    data["roles"][index].privilegios[i].activo =
                                        value;
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
                );
              },
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(getRolesUsuarioProvider);
                  },
                  child: Text('Reintentar cargar roles',
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
