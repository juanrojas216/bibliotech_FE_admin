import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultDialog extends ConsumerWidget {
  final Icon iconDialog;
  final String messageDialog;

  const ResultDialog(
      {super.key, required this.iconDialog, required this.messageDialog});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconDialog,
              const SizedBox(height: 5),
              Text(messageDialog),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: const Text('Aceptar'),
        )
      ],
    );
  }
}
