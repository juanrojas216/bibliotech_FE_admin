import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';
import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:date_field/date_field.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../dto/reporte.dto.dart';

class ReportesPage extends ConsumerStatefulWidget {
  const ReportesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportesPageState();
}

class _ReportesPageState extends ConsumerState<ReportesPage> {
  ReporteDto reportePrestamoDto = ReporteDto();
  ReporteDto reporteTiempoDto = ReporteDto();
  ReporteDto reporteMultaDto = ReporteDto();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('REPORTES',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Container(
            height: 100.h,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: const Border.fromBorderSide(
                  BorderSide(color: Colors.grey, width: 2)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        //? REPORTE DE PRÉSTAMOS
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "INFORME DE PRÉSTAMOS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ),
                        Card(
                          shape: Border.all(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: SizedBox(
                              height: 103,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA INICIO',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reportePrestamoDto.fechaDesde =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                } else if (reportePrestamoDto
                                                            .fechaDesde !=
                                                        null &&
                                                    reportePrestamoDto.fechaDesde!
                                                        .isAfter(value)) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA FIN',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reportePrestamoDto.fechaHasta =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.download,
                                          color: reportePrestamoDto.fechaDesde !=
                                                      null &&
                                                  reportePrestamoDto.fechaHasta !=
                                                      null &&
                                                  reportePrestamoDto.fechaDesde!
                                                      .isBefore(reportePrestamoDto
                                                          .fechaHasta!)
                                              ? Colors.purple
                                              : Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var response = await ref
                                              .read(apiProvider)
                                              .request(
                                                  "/reportes/informe-prestamo/export-pdf",
                                                  method: HttpMethod.post,
                                                  body:
                                                      reportePrestamoDto.toMap());
                                          if (response.error != null) return;
                                          download(
                                              Stream.fromIterable(
                                                  response.data.codeUnits),
                                              'reporte.pdf');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        //? REPORTE DE TIEMPOS
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "INFORME DE TIEMPOS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ),
                        Card(
                          shape: Border.all(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: SizedBox(
                              height: 103,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA INICIO',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reporteTiempoDto.fechaDesde =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                } else if (reporteTiempoDto
                                                            .fechaDesde !=
                                                        null &&
                                                    reporteTiempoDto.fechaDesde!
                                                        .isAfter(value)) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA FIN',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reporteTiempoDto.fechaHasta =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.download,
                                          color: reporteTiempoDto.fechaDesde !=
                                                      null &&
                                                  reporteTiempoDto.fechaHasta !=
                                                      null &&
                                                  reporteTiempoDto.fechaDesde!
                                                      .isBefore(reporteTiempoDto
                                                          .fechaHasta!)
                                              ? Colors.purple
                                              : Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var response = await ref
                                              .read(apiProvider)
                                              .request(
                                                  "/reportes/informe-tiempo/export-pdf",
                                                  method: HttpMethod.post,
                                                  body: reporteTiempoDto.toMap());
                                          if (response.error != null) return;
                                          download(
                                              Stream.fromIterable(
                                                  response.data.codeUnits),
                                              'reporte.pdf');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        //? REPORTE DE MULTAS
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "INFORME DE MULTAS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ),
                        Card(
                          shape: Border.all(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: SizedBox(
                              height: 103,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA INICIO',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reporteMultaDto.fechaDesde =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: DateTimeFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                } else if (reporteMultaDto
                                                            .fechaDesde !=
                                                        null &&
                                                    reporteMultaDto.fechaDesde!
                                                        .isAfter(value)) {
                                                  return "Debe seleccionar una fecha posterior a la fecha inicio";
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                errorStyle: TextStyle(
                                                    color: Colors.redAccent),
                                                border: OutlineInputBorder(),
                                                suffixIcon:
                                                    Icon(Icons.event_note),
                                                labelText: 'FECHA FIN',
                                              ),
                                              dateFormat:
                                                  DateFormat('dd-MM-yyyy'),
                                              firstDate: DateTime.now(),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              onDateSelected: (DateTime value) {
                                                reporteMultaDto.fechaHasta =
                                                    value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.download,
                                          color: reporteMultaDto.fechaDesde !=
                                                      null &&
                                                  reporteMultaDto.fechaHasta !=
                                                      null &&
                                                  reporteMultaDto.fechaDesde!
                                                      .isBefore(reporteMultaDto
                                                          .fechaHasta!)
                                              ? Colors.purple
                                              : Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var response = await ref
                                              .read(apiProvider)
                                              .request(
                                                  "/reportes/informe-multa/export-pdf",
                                                  method: HttpMethod.post,
                                                  body: reporteMultaDto.toMap());
                                          if (response.error != null) return;
                                          download(
                                              Stream.fromIterable(
                                                  response.data.codeUnits),
                                              'reporte.pdf');
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        //? REPORTE DE EXISTENCIAS
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "INFORME DE EXISTENCIAS",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ),
                        Card(
                          shape: Border.all(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: SizedBox(
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                                child: ElevatedButton(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("DESCARGAR INFORME"),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.download,
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    var response = await ref
                                        .read(apiProvider)
                                        .request(
                                            "/reportes/informe-existencias/export-pdf",
                                            method: HttpMethod.post,
                                            body: reporteTiempoDto.toMap());
                                    if (response.error != null) return;
                                    download(
                                        Stream.fromIterable(
                                            response.data.codeUnits),
                                        'reporte.pdf');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
