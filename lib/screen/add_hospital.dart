import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medi_tect_admin/constants/styles.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';
import 'package:medi_tect_admin/widgets/custom_text.dart';

class AddHospital extends StatelessWidget {
  const AddHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _wardName = "";
    String _totalBeds = "";
    String _contact = "";

    _addBeds() async {
      // Call the user's CollectionReference to add a new user
      await FirebaseFirestore.instance.collection('ward').doc().set({
        'wardName': _wardName,
        'totalBeds': _totalBeds,
        'availableBeds': _totalBeds,
        'contact': _contact,
      });
    }

    return Scaffold(
      appBar: myAppBar("Add Hospital"),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 32.0),
            child: Center(
              child: Text(
                "Add New Hospital Bed",
                style: MyStyles.heading,
              ),
            ),
          ),
          CustomTextField(
            helperText: "Ward Name",
            hintText: "Enter Ward Name",
            onChanged: (value) {
              _wardName = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Total Beds",
            hintText: "Enter Total Number of Beds",
            onChanged: (value) {
              _totalBeds = value;
            },
            obscureText: false,
          ),
          CustomTextField(
            helperText: "Contact",
            hintText: "Enter Contact Details",
            onChanged: (value) {
              _contact = value;
            },
            obscureText: false,
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text("Add Bed"),
              onPressed: () {
                _addBeds();
              },
            ),
          ),
        ],
      ),
    );
  }
}
