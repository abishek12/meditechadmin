import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:medi_tect_admin/screen/edit_vaccine.dart';
import 'package:medi_tect_admin/screen/esewa_epay.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class VaccineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('vaccine').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return Scaffold(
            appBar: myAppBar("Vaccine"),
            body: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditVaccine(
                                  vName: data['name'],
                                  vTotal: data['total'],
                                  vDose: data['dose'],
                                  vContact: data['contact'],
                                  docId: snapshot.data!.docs[i].id,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: ListTile(
                          leading: Image.asset("assets/icons/vaccine.png"),
                          title: Text(data['name']),
                          subtitle: Text(
                            "Total: " + data['total'],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Get.to(() => EsewaEpay());
                            },
                            icon: Icon(
                              Icons.payment,
                              color: Colors.green,
                              size: 28.0,
                            ),
                          )),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/addVaccine");
              },
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
