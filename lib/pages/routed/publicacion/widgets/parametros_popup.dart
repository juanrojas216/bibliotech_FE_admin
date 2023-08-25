

import 'package:flutter/material.dart';

import '../../../parametrospages/editoriales_abm.dart';

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
    return ElevatedButton(
      onPressed: () => {_showDialog()},
      child: const Text("Parámetros"),
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
