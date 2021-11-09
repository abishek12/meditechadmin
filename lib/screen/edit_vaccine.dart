import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class EditVaccine extends StatefulWidget {
  String docId = "";
  String vName = "";
  String vTotal = "";
  String vContact = "";
  String vDose = "";

  EditVaccine(
      {required this.docId,
      required this.vName,
      required this.vTotal,
      required this.vContact,
      required this.vDose});

  @override
  _EditVaccineState createState() => _EditVaccineState();
}

class _EditVaccineState extends State<EditVaccine> {
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    _deleteVaccine() async {
      await FirebaseFirestore.instance
          .collection('vaccine')
          .doc(widget.docId)
          .delete();
      Navigator.pop(context);
    }

    _updateLabTest() async {
      await FirebaseFirestore.instance
          .collection('vaccine')
          .doc(widget.docId)
          .update({
        'name': widget.vName,
        'total': widget.vTotal,
        'dose': widget.vDose,
        'contact': widget.vContact,
        'display': 'true',
        'time': '10:00 A.M',
        'date': _dateTime,
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
              controller: TextEditingController()..text = "${widget.vName}",
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                widget.vName = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "${widget.vTotal}",
              decoration: InputDecoration(
                labelText: "Total",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                widget.vTotal = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "${widget.vDose}",
              decoration: InputDecoration(
                labelText: "Dose",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                widget.vDose = value;
              },
              obscureText: false,
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = "${widget.vContact}",
              decoration: InputDecoration(
                labelText: "Contact",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                widget.vContact = value;
              },
              obscureText: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _dateTime == null ? "Select a date" : _dateTime.toString(),
              ),
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(2020, 11, 17),
                    firstDate: DateTime(2017, 1),
                    lastDate: DateTime(2022, 7),
                    helpText: 'Select a date',
                  ).then((value) {
                    setState(() {
                      _dateTime = value!;
                    });
                  });
                },
                icon: Icon(CupertinoIcons.clock_fill),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _deleteVaccine();
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
