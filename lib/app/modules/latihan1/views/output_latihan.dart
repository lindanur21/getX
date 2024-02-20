import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan1_controller.dart';

class OutPut extends StatelessWidget {
  final Latihan1Controller latihan1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Member"),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('FullName : ${latihan1.fullname.value}'),
                    ),
                    ListTile(
                      title: Text(
                          'Place Of Birth : ${latihan1.placeofbirth.value}'),
                    ),
                    ListTile(
                      title: Text('Date Of Birth : ${latihan1.calculateAge()}'),
                    ),
                    ListTile(
                      title: Text('Gander : ${latihan1.gender.value}'),
                    ),
                    ListTile(
                      title: Text('Email : ${latihan1.email.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Nationality : ${latihan1.nationality.value} '),
                    ),
                    ListTile(
                      title: Text('MemberShip : ${latihan1.membership.value} '),
                    ),
                    ListTile(
                      title: Text('Benefits : ${latihan1.benefits.value} '),
                    ),
                    ListTile(
                      title: Text('Card Number : ${latihan1.cardnumber.value} '),
                    ),
                    ListTile(
                      title:
                          Text('Expired Date : ${latihan1.expireddate.value} '),
                    ),
                    ListTile(
                      title: Text('Payment : ${latihan1.harga.value} '),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
