import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';
import '../controllers/get_usuario.controller.dart';
import '../dto/create_multa.dto.dart';
import '../dto/search_usuario.dart';
import '../repositoy/create_multa.repository.dart';
import '../repositoy/usuarios.repository.dart';
import '../validations/index.dart';

class SelectUserPage extends ConsumerStatefulWidget {
  const SelectUserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends ConsumerState<SelectUserPage> {
  
  SearchUsuarioDto search = SearchUsuarioDto(
    idUsuario: null,
    legajo: null,
    apellido: null,
    nombre: null,
  );

  @override
  Widget build(BuildContext context) {
    var usuarios = ref.watch(usuariosMultasProvider);
    var searchUser = ref.watch(searchUsuariosProvider(search));

    return AlertDialog(
      content: Card(
        shape: Border.all(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SELECCIONAR USUARIO",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          ref.read(routesProvider).pop();
                        },
                        child: Text(
                          'VOLVER',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: (usuarios
                                    .where((e) => e.value == true)
                                    .toList()
                                    .isEmpty)
                                ? const MaterialStatePropertyAll(Colors.grey)
                                : const MaterialStatePropertyAll(
                                    Colors.purple)),
                        onPressed: () {
                          var userSelected =
                              usuarios.where((e) => e.value == true).toList();
                          if (userSelected.isEmpty) return;
                          ref
                              .read(createMultaProvider.notifier)
                              .update((state) {
                            var newState = CreateMultaDto(
                              idUsuario: userSelected[0].id.toString(),
                              nombre: '${userSelected[0].nombre} ${userSelected[0]..apellido}',
                              // idPublicacion: state.idPublicacion,
                              idEjemplar: state.idEjemplar,
                              nombrePublicacion: state.nombrePublicacion,
                              idPrestamo: state.idPrestamo,
                              fechaInicioMulta: state.fechaInicioMulta,
                            );
                            return newState;
                          });
                          ref.read(routesProvider).push('/multa/seleccionar-prestamo');
                        },
                        child: Text(
                          'SIGUIENTE',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.grey),




              //INPUT DE BÚSQUEDA
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintText: 'Búsqueda por id',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.idUsuario = null : search.idUsuario = value;
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintText: 'Búsqueda por legajo',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.legajo = null : search.legajo = value;
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintText: 'Búsqueda por nombre',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.nombre = null : search.nombre = value;
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintText: 'Búsqueda por apellido',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.apellido = null : search.apellido = value;
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: (!searchUsuarioValidacion(search))
                              ? const MaterialStatePropertyAll(Colors.grey)
                              : const MaterialStatePropertyAll(Colors.purple)),
                      onPressed: () {
                        if (!searchUsuarioValidacion(search)) return;
                        ref.invalidate(searchUsuariosProvider);
                        setState(() {});
                      },
                      child: Text('Buscar resultados',
                          style: GoogleFonts.poppins()),
                    ),
                  ],
                ),
              ),



              //TABLA DE RESULTADOS
              searchUser.when(
                skipLoadingOnRefresh: false,
                data: (_) => Visibility(
                  visible: usuarios.isNotEmpty,
                  replacement: Flexible(
                    child: Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(height: 5),
                              Text('No se han encontrado usuarios'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Flexible(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 400,
                      child: ListView.builder(
                        itemCount: usuarios.length,
                        itemBuilder: (_, i) {
                          return CheckboxListTile(
                            value: usuarios[i].value,
                            title: Text(
                              "${usuarios[i].id} - ${usuarios[i].legajo} ${usuarios[i].apellido} - ${usuarios[i].legajo} - ${usuarios[i].dni}",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            onChanged: (value) {
                              if (value.isNull) return;
                              for (var element in usuarios) {
                                element.value = false;
                              }
                              usuarios[i].value = value!;
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                error: (__, _) => Flexible(
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Reintentar cargar usuarios'),
                      onPressed: () {
                        ref.invalidate(searchUsuariosProvider(search));
                      },
                    ),
                  ),
                ),
                loading: () => const Flexible(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
