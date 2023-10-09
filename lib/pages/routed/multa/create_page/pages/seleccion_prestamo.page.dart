import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bibliotech_admin/config/router/admin_router.dart';
import '../controllers/get_prestamos.controller.dart';
import '../dto/create_multa.dto.dart';
import '../dto/search_prestamo.dart';
import '../repositoy/create_multa.repository.dart';
import '../repositoy/prestamos.repository.dart';
import '../validations/index.dart';

class SelectPrestamoPage extends ConsumerStatefulWidget {
  const SelectPrestamoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectPrestamoPageState();
}

class _SelectPrestamoPageState extends ConsumerState<SelectPrestamoPage> {
  
  late SearchPrestamoDto search;

  @override
  void initState() {
    super.initState();
    search = SearchPrestamoDto(
    idUsuario: ref.read(createMultaProvider).idUsuario,
    nombrePublicacion: null,
    idEjemplar: null, 
    idPrestamo: null,
  );
  }

  @override
  Widget build(BuildContext context) {
    var prestamos = ref.watch(prestamosMultasProvider);
    var searchPrestamo = ref.watch(searchPrestamosProvider(search));

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
                    "SELECCIONAR PRÉSTAMO",
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
                            backgroundColor: (prestamos
                                    .where((e) => e.value == true)
                                    .toList()
                                    .isEmpty)
                                ? const MaterialStatePropertyAll(Colors.grey)
                                : const MaterialStatePropertyAll(
                                    Colors.purple)),
                        onPressed: () {
                          var prestamoSelected = prestamos.where((e) => e.value == true).toList();
                          if (prestamoSelected.isEmpty) return;
                          ref
                              .read(createMultaProvider.notifier)
                              .update((state) {
                            var newState = CreateMultaDto(
                              idUsuario: state.idUsuario,
                              nombre: state.nombre,
                              // idPublicacion: state.idPublicacion,
                              idEjemplar: prestamoSelected[0].ejemplar,
                              nombrePublicacion: prestamoSelected[0].publicacion,
                              idPrestamo: prestamoSelected[0].id.toString(),
                              fechaInicioMulta: state.fechaInicioMulta,
                            );
                            return newState;
                          });
                          ref.read(routesProvider).push('/multa/creacion');
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
                          hintText: 'Búsqueda por publicacion',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.nombrePublicacion = null : search.nombrePublicacion = value;
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
                          hintText: 'Búsqueda por id de ejemplar',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.idEjemplar = null : search.idEjemplar = value;
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
                          hintText: 'Búsqueda por id de préstamo',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onChanged: (value) {
                          value.isEmpty ? search.idPrestamo = null : search.idPrestamo = int.parse(value);
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
                          backgroundColor: (!searchPrestamoValidacion(search))
                              ? const MaterialStatePropertyAll(Colors.grey)
                              : const MaterialStatePropertyAll(Colors.purple)),
                      onPressed: () {
                        if (!searchPrestamoValidacion(search)) return;
                        ref.invalidate(searchPrestamosProvider);
                        setState(() {});
                      },
                      child: Text('Buscar resultados',
                          style: GoogleFonts.poppins()),
                    ),
                  ],
                ),
              ),



              //TABLA DE RESULTADOS
              searchPrestamo.when(
                skipLoadingOnRefresh: false,
                data: (_) => Visibility(
                  visible: prestamos.isNotEmpty,
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
                              Text('No se han encontrado prestamos'),
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
                        itemCount: prestamos.length,
                        itemBuilder: (_, i) {
                          return CheckboxListTile(
                            value: prestamos[i].value,
                            title: Text(
                              "${prestamos[i].id} - ${prestamos[i].publicacion} ${prestamos[i].ejemplar} - ${prestamos[i].fechaInicio} - ${prestamos[i].estado}",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            onChanged: (value) {
                              if (value.isNull) return;
                              for (var element in prestamos) {
                                element.value = false;
                              }
                              prestamos[i].value = value!;
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
                        ref.invalidate(searchPrestamosProvider(search));
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
