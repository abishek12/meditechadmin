import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';

class BedScreen extends StatelessWidget {
  const BedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Beds"),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, items) {
            return Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bed Number $items"),
                  Text(items % 2 == 0 ? "Available" : "Not Available"),
                ],
              ),
            );
          }),
    );
  }
}
