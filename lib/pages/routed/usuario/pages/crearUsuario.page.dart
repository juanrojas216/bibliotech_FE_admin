import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/crearUsuario.controller.dart';
import '../../../../config/router/admin_router.dart';
import '../../../../widgets/crear_entidad.dart';
import '../controllers/getAllUsuarios.controller.dart';
import '../dto/createUsuario.dto.dart';
import '../validations/usuario.validation.dart';

class UsuarioAdd extends ConsumerStatefulWidget {
  const UsuarioAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUsuarioState();
}

class _AddUsuarioState extends ConsumerState<UsuarioAdd> {
  late CreateUsuarioDto crearUsuarioDto;

  @override
  void initState() {
    crearUsuarioDto = CreateUsuarioDto(nombre: null, apellido: null, password: null, email: null, roles: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo usuario',
          style: GoogleFonts.poppins(), textAlign: TextAlign.center),
      content: SizedBox(
        width: 800,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => {
                    crearUsuarioDto.nombre = value,
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
                    crearUsuarioDto.apellido = value,
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
                    crearUsuarioDto.password = value,
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
                    crearUsuarioDto.email = value,
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
                        selectedColor: const Color.fromARGB(255, 214, 137, 228),
                        disabledColor: Colors.grey,
                        selected: crearUsuarioDto.roles.contains(3),
                        onSelected: (value) {
                          if (value) {
                            if (!crearUsuarioDto.roles.contains(3)) {
                              crearUsuarioDto.roles.add(3);
                              setState(() {});
                            }
                            return;
                          } else {
                            if (crearUsuarioDto.roles.contains(3)) {
                              crearUsuarioDto.roles.removeWhere((e) => e == 3);
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
                        selectedColor: const Color.fromARGB(255, 214, 137, 228),
                        disabledColor: Colors.grey,
                        selected: crearUsuarioDto.roles.contains(2),
                        onSelected: (value) {
                          if (value) {
                            if (!crearUsuarioDto.roles.contains(2)) {
                              crearUsuarioDto.roles.add(2);
                              setState(() {});
                            }
                            return;
                          } else {
                            if (crearUsuarioDto.roles.contains(2)) {
                              crearUsuarioDto.roles.removeWhere((e) => e == 2);
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
                        selectedColor: const Color.fromARGB(255, 214, 137, 228),
                        disabledColor: Colors.grey,
                        selected: crearUsuarioDto.roles.contains(1),
                        onSelected: (value) {
                          if (value) {
                            if (!crearUsuarioDto.roles.contains(1)) {
                              crearUsuarioDto.roles.add(1);
                              setState(() {});
                            }
                            return;
                          } else {
                            if (crearUsuarioDto.roles.contains(1)) {
                              crearUsuarioDto.roles.removeWhere((e) => e == 1);
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
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(
            onPressed: () async {
              if (!usuarioValidacion(crearUsuarioDto)) return;
              ref.read(routesProvider).pop();
              await showDialog(
                  context: context,
                  builder: (_) => CrearEntidad<CreateUsuarioDto>(
                        entidad: crearUsuarioDto,
                        nombreProvider: crearUsuarioProvider,
                        mensajeResult: 'USUARIO CREADO',
                        mensajeError: 'ERROR AL CREAR USUARIO',
                      ));
              ref.invalidate(getAllUsuariosProvider);
            },
            style: ButtonStyle(
              backgroundColor: usuarioValidacion(crearUsuarioDto)
                  ? const MaterialStatePropertyAll(Colors.purple)
                  : const MaterialStatePropertyAll(Colors.grey),
            ),
            child: const Text('Agregar usuario')),
        ElevatedButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            child: const Text('Cancelar'))
      ],
    );
  }
}
