


import 'package:flutter/material.dart';

import '../../../creatorpages/nuevapublicacion.dart';

class NuevaPublicacion extends StatelessWidget {
  const NuevaPublicacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Row(
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
