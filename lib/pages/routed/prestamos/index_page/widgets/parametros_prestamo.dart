import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/get_parametros_prestamo.controller.dart';
import '../controllers/guardar_parametro.controller.dart';
import '../dto/parametro_prestamo.dto.dart';
import '../validations/parametro.validation.dart';

class ParametrosPrestamo extends ConsumerStatefulWidget {
  const ParametrosPrestamo({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ParametrosPrestamoState();
}

class _ParametrosPrestamoState extends ConsumerState<ParametrosPrestamo> {
  
  @override
  Widget build(BuildContext context) {
  
    var search = ref.watch(getParametrosPrestamoProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: search.when(
        data: (data) => SizedBox(
          height: 100,
          width: 800,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              children: [ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: data.diasMaximoPrestamo.toString(),
                        onChanged: (value) {
                          data.cantidadMaximaRenovacion = int.tryParse(value);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'DURACIÓN MÁXIMA PRESTAMO',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        initialValue: data.diasMaximoRenovacion.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          data.diasMaximoRenovacion = int.tryParse(value);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'DURACIÓN MÁXIMA DIÁS DE RENOVACIÓN',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        initialValue: data.cantidadMaximaRenovacion.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          data.cantidadMaximaRenovacion = int.tryParse(value);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'CANTIDAD MÁXIMA RENOVACIONES',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins.toString(),
                              fontSize: 14),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.save,
                    color: parametroPrestamoValidacion(data)
                        ? Colors.purple
                        : Colors.grey,
                  ),
                  onPressed: () {
                    if (!parametroPrestamoValidacion(data)) return;
                    showCupertinoDialog(
                      context: context,
                      builder: (context) =>
                          ModificarEntidad<ParametrosPrestamoDto>(
                              entidad: data,
                              nombreProvider: updateParametroPrestamoProvider,
                              mensajeResult: "PARÁMETRO ACTUALIZADO",
                              mensajeError:
                                  "ERROR AL ACTUALIZAR EL PARÁMETRO"),
                    );
                  },
                ),
              )],
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(getParametrosPrestamoProvider);
                },
                child: Text('Reintentar cargar parametros',
                    style: GoogleFonts.poppins()))),
        loading: () => const SizedBox(
          height: 1000,
          width: 800,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
