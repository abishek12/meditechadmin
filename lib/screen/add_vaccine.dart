import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/constants/styles.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_text.dart';

class AddVaccine extends StatefulWidget {
  const AddVaccine({Key? key}) : super(key: key);

  @override
  _AddVaccineState createState() => _AddVaccineState();
}

class _AddVaccineState extends State<AddVaccine> {
  DateTime? _dateTime;

  String _vName = "";
  String _vTotal = "";
  String _vDose = "";
  String _vContact = "";

  _addVaccine() async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance.collection('vaccine').doc().set({
      'name': _vName,
      'total': _vTotal,
      'dose': _vDose,
      'contact': _vContact,
      'display': "true",
      'time': "10:00 A.M",
      'date' : _dateTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Add Vaccine"),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Add New Vaccine",
                style: MyStyles.heading,
              ),
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          CustomTextField(
            helperText: "Vaccine Name",
            hintText: "Enter vaccine name",
            onChanged: (value) {
              _vName = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Total Vaccine",
            hintText: "Enter total number of vaccine",
            onChanged: (value) {
              _vTotal = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Dose",
            hintText: "First or Second",
            onChanged: (value) {
              _vDose = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Contact",
            hintText: "Enter contact number",
            onChanged: (value) {
              _vContact = value;
            },
            obscureText: false,
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
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
               _addVaccine();
              },
              child: Text("Add Vaccine"),
            ),
          )
        ],
      ),
    );
  }
}
