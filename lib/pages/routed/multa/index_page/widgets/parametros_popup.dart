import 'package:bibliotech_admin/widgets/modificar_entidad.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/get_parametros_multa.controller.dart';
import '../controllers/get_detalle_multa.controller.dart';
import '../controllers/guardar_parametro.controller.dart';
import '../controllers/delete_parametro.controller.dart';
import '../dto/parametro_multa.dto.dart';
import '../validations/parametro.validation.dart';

class ParametrosMulta extends ConsumerStatefulWidget {
  const ParametrosMulta({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ParametrosMultaState();
}

class _ParametrosMultaState extends ConsumerState<ParametrosMulta> {
  
  @override
  Widget build(BuildContext context) {

    var search = ref.watch(getParametrosMultasProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 300,
            width: 800,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: data[index].nombre,
                            onChanged: (value) {
                              data[index].nombre = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'NOMBRE DE PARÁMETRO',
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
                            initialValue: data[index].dias.toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              data[index].dias = int.tryParse(value) ?? 0;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'CANTIDAD DE DÍAS',
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.save,
                            color: parametroMultaValidacion(data[index])
                                ? Colors.purple
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (!parametroMultaValidacion(data[index])) return;
                            showCupertinoDialog(
                              context: context,
                              builder: (context) =>
                                  ModificarEntidad<ParametroMultaDto>(
                                      entidad: data[index],
                                      nombreProvider:
                                          updateParametroMultaProvider,
                                      mensajeResult: "PARÁMETRO ACTUALIZADO",
                                      mensajeError:
                                          "ERROR AL ACTUALIZAR EL PARÁMETRO"),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => EliminarEntidad(
                                  nombreProvider: deleteParametroMultaProvider(
                                      data[index].id),
                                  mensajeResult: "PARÁMETRO ELIMINADO",
                                  mensajeError:
                                      "ERROR AL ELIMINAR EL PARÁMETRO"),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(getDetalleMultaProvider);
                  },
                  child: Text('Reintentar cargar parametros',
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
