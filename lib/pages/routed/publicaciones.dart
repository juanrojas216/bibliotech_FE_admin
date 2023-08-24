import 'package:bibliotech_admin/pages/creatorpages/nuevapublicacion.dart';
import 'package:bibliotech_admin/pages/parametrospages/editoriales_abm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:layout/layout.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublicacionesPage extends StatelessWidget {
  const PublicacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Margin(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Publicaciones",
                      style: TextStyle(fontSize: 25),
                    ),
                    Row(
                      children: [
                        ParametrosPopUp(),
                        SizedBox(
                          width: 20,
                        ),
                        NuevaPublicacion(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 85.h,
                child: const TablaPublicaciones(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NuevaPublicacion extends StatelessWidget {
  const NuevaPublicacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "nueva_publicacion",
      label: const Row(
        children: [
          Icon(Icons.add),
          SizedBox(
            width: 10,
          ),
          Text('Nueva publicación'),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NuevaPublicacionScreen()),
        );
      },
    );
  }
}

class ParametrosPopUp extends StatefulWidget {
  const ParametrosPopUp({
    super.key,
  });

  @override
  State<ParametrosPopUp> createState() => _ParametrosPopUpState();
}

class _ParametrosPopUpState extends State<ParametrosPopUp> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => {_showDialog()},
      label: const Text("Parámetros"),
      heroTag: "parametros",
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Parámetros"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditorialesAbm()),
                    );
                  },
                  label: const Text(
                    'Ver editoriales',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver ediciones',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver autores',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver categorías',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver ubicaciones',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver tipos de publicación',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver facultades',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  label: const Text(
                    'Ver carreras',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    fixedSize: const Size(250, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              OutlinedButton(
                child: const Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

class TablaPublicaciones extends StatefulWidget {
  const TablaPublicaciones({
    super.key,
  });

  @override
  State<TablaPublicaciones> createState() => TablaPublicacionesState();
}

class TablaPublicacionesState extends State<TablaPublicaciones> {
  late PlutoGridStateManager stateManagerProviders;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      configuration: const PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
            gridBackgroundColor: Colors.transparent,
            gridBorderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          columnSize: PlutoGridColumnSizeConfig(
            autoSizeMode: PlutoAutoSizeMode.scale,
          )),
      mode: PlutoGridMode.readOnly,
      createFooter: (stateManager) {
        stateManager.setPageSize(40, notify: false); // default 40
        return PlutoPagination(stateManager);
      },
      columns: [
        PlutoColumn(
            title: 'Título',
            field: 'titulo',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Autor',
            field: 'autor',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Editorial',
            field: 'editorial',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Edición',
            field: 'edicion',
            type: PlutoColumnType.text(),
            readOnly: true),
        PlutoColumn(
            title: 'Año',
            field: 'anio',
            type: PlutoColumnType.number(),
            readOnly: true),
      ],
      rows: [
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
        PlutoRow(cells: {
          'titulo': PlutoCell(value: 'Harry Potter y la piedra filosofal'),
          'autor': PlutoCell(value: 'J.K. Rowling'),
          'editorial': PlutoCell(value: 'Salamandra'),
          'edicion': PlutoCell(value: '20 Aniversario'),
          'anio': PlutoCell(value: 2020),
        }),
      ],
    );
  }
}
