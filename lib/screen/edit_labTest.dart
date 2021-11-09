import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class EditLabTest extends StatelessWidget {
  String docId = "";
  String lName = "";
  String lPrice = "";

  EditLabTest({required this.docId, required this.lName, required this.lPrice});

  @override
  Widget build(BuildContext context) {
    _deleteLabTest() async {
      await FirebaseFirestore.instance
          .collection('labTest')
          .doc(docId)
          .delete();
      Navigator.pop(context);
    }

    _updateLabTest() async {
      await FirebaseFirestore.instance.collection('labTest').doc(docId).update({
        'name': lName,
        'price': lPrice,
        'date': DateTime.now(),
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: myAppBar("Update LabTest"),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 32.0,
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "$lName",
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                lName = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "$lPrice",
              decoration: InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                lPrice = value;
              },
              obscureText: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _deleteLabTest();
                },
                child: Text("delete"),
              ),
              SizedBox(
                width: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _updateLabTest();
                  print("$lName + $lPrice");
                },
                child: Text("Update"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
