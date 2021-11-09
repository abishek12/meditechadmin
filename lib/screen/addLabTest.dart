import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/constants/styles.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';
import 'package:medi_tect_admin/widgets/custom_text.dart';

class AddLabTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _lName = "";
    String _lPrice = "";

    _addLabTest() async {
      // Call the user's CollectionReference to add a new user
      await FirebaseFirestore.instance.collection('labTest').doc().set({
        'name': _lName,
        'price': _lPrice,
        'date': DateTime.now(),
      });
    }

    return Scaffold(
      appBar: myAppBar("Add Lab Test"),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 32.0),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Add New Lab Test",
                style: MyStyles.heading,
              ),
            ),
          ),
          CustomTextField(
            helperText: "Name",
            hintText: "Enter name",
            onChanged: (value) {
              _lName = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Price",
            hintText: "Enter price",
            onChanged: (value) {
              _lPrice = value;
            },
            obscureText: false,
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _addLabTest();
              },
              child: Text("Add LabTest"),
            ),
          ),
        ],
      ),
    );
  }
}
