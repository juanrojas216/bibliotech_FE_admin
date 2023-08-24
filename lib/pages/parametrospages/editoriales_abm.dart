import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditorialesAbm extends StatelessWidget {
  const EditorialesAbm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Column(children: [
        Text("EDITORIALES"),
        Row(
          children: [
            Text("TEST"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ],
        )
      ]),
    )));
  }
}
