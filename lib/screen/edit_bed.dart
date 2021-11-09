import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class EditBeds extends StatelessWidget {
  String docId = "";
  String wardName = "";
  String totalBeds = "";
  String contact = "";
  String availableBeds = "";

  EditBeds(
      {required this.docId,
      required this.wardName,
      required this.totalBeds,
      required this.contact,
      required this.availableBeds});

  @override
  Widget build(BuildContext context) {
    _deleteBeds() async {
      await FirebaseFirestore.instance.collection('ward').doc(docId).delete();
      Navigator.pop(context);
    }

    _updateLabTest() async {
      await FirebaseFirestore.instance.collection('ward').doc(docId).update({
        'wardName': wardName,
        'totalBeds': totalBeds,
        'contact': contact,
        'availableBeds': availableBeds,
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
              controller: TextEditingController()..text = "$wardName",
              decoration: InputDecoration(
                labelText: "Ward Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                wardName = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "$totalBeds",
              decoration: InputDecoration(
                labelText: "Total Beds",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                totalBeds = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "$contact",
              decoration: InputDecoration(
                labelText: "Contact",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                contact = value;
              },
              obscureText: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _deleteBeds();
                },
                child: Text("delete"),
              ),
              SizedBox(
                width: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _updateLabTest();
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
