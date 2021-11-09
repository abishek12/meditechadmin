import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:medi_tect_admin/screen/edit_labTest.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';

// ignore: must_be_immutable
class LabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('labTest').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return Scaffold(
            appBar: myAppBar("Lab Test"),
            floatingActionButton: FloatingActionButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/addLab");
              },
            ),
            body: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditLabTest(
                              docId: snapshot.data!.docs[i].id,
                              lName: data['name'],
                              lPrice: data['price']))),
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("assets/icons/hospital.png"),
                        title: Text(data['name']),
                        subtitle: Text(
                          data['price'],
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
