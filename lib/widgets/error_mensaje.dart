
import 'package:bibliotech_admin/config/helpers/http_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ErrorResultadoWidget extends ConsumerWidget {
  final String message;
  final AutoDisposeFutureProvider provider;
  final Object response;

  const ErrorResultadoWidget({
    required this.message,
    required this.provider,
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Visibility(
        visible: (response as HtttpResult).statusCode == 403,
        replacement: ElevatedButton(
          child: Text(message),
          onPressed: () {
            ref.invalidate(provider);
          },
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.not_interested_sharp),
                SizedBox(height: 5),
                Text("ACCESO NO AUTORIZADO"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
