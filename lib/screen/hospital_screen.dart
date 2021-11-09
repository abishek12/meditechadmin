import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:medi_tect_admin/screen/book_hospital_screen.dart';
import 'package:medi_tect_admin/screen/edit_bed.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/custom_drawer.dart';

// ignore: must_be_immutable
class HospitalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('ward').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return Scaffold(
            appBar: myAppBar("Hospital"),
            drawer: MyDrawer(),
            floatingActionButton: FloatingActionButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/addHospital");
              },
            ),
            body: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditBeds(
                                  docId: snapshot.data!.docs[i].id,
                                  wardName: data['wardName'],
                                  totalBeds: data['totalBeds'],
                                  availableBeds: data['availableBeds'],
                                  contact: data['contact'],
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("assets/icons/hospital.png"),
                        title: Text(data['wardName']),
                        subtitle:
                            Text(data['totalBeds'] + "  " + data['contact']),
                        trailing: IconButton(
                          icon: Icon(
                            CupertinoIcons.arrow_right_circle,
                          ),
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BookHospitalScreen(
                                        hospitalName: data['wardName'],
                                        hospitalContact: data['contact'],
                                        hospitalRemainingBeds:
                                            data['availableBeds'],
                                        hospitalTotalBeds: data['totalBeds'],
                                      ))),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
