import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:learn_getx/app/modules/latihan1/controllers/latihan1_controller.dart';
import 'package:intl/intl.dart';
import 'package:learn_getx/app/modules/latihan1/views/output_latihan.dart';

class Latihan1 extends StatelessWidget {
  Latihan1({Key? key}) : super(key: key);

  final Latihan1Controller latihanController = Get.put(Latihan1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'A. Personal Information',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fullname'),
                      onChanged: (value) =>
                          latihanController.fullname.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Place of Birth'),
                      onChanged: (value) =>
                          latihanController.placeofbirth.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => latihanController.selectbirthDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          hintText: 'Select Date',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date of Birth:'),
                            Obx(() => Text(
                                latihanController.selectedbirthDate.value)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text("Gender"),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Male',
                              groupValue: latihanController.gender.value,
                              onChanged: (value) =>
                                  latihanController.gender.value = value!,
                            )),
                        Text('Male'),
                        Obx(() => Radio(
                              value: 'Female',
                              groupValue: latihanController.gender.value,
                              onChanged: (value) =>
                                  latihanController.gender.value = value!,
                            )),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) =>
                          latihanController.email.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nationality'),
                      onChanged: (value) =>
                          latihanController.nationality.value = value,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(() => Radio(
                                  value: 'Reguler',
                                  groupValue:
                                      latihanController.membership.value,
                                  onChanged: (value) => latihanController
                                      .toggleMembership(value!),
                                )),
                            Text("Reguler"),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Gold',
                                      groupValue:
                                          latihanController.membership.value,
                                      onChanged: (value) => latihanController
                                          .toggleMembership(value!),
                                    )),
                                Text("Gold"),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'Platinum',
                                      groupValue:
                                          latihanController.membership.value,
                                      onChanged: (value) => latihanController
                                          .toggleMembership(value!),
                                    )),
                                Text("Platinum"),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(() => Radio(
                                      value: 'VIP',
                                      groupValue:
                                          latihanController.membership.value,
                                      onChanged: (value) => latihanController
                                          .toggleMembership(value!),
                                    )),
                                Text("VIP"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'C. Payment Details',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Card Number'),
                          onChanged: (value) =>
                              latihanController.cardnumber.value = value,
                        ),
                        SizedBox(height: 16.0),
                        InkWell(
                          onTap: () =>
                              latihanController.selectExpiredDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              hintText: 'Pilih Tanggal',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Expired Date: '),
                                Obx(() =>
                                    Text(latihanController.expireddate.value)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => Get.to(OutPut()),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Obx(() {
              //   if (latihanController.isFormSubmitted.value) {
              //     return Text(
              //       'Output: ${latihanController.fullname}, ${latihanController.placeofbirth}, ${latihanController.calculateAge()}, ${latihanController.gender}, ${latihanController.email}, ${latihanController.nationality}, ${latihanController.membership}, ${latihanController.cardnumber}, ${latihanController.expireddate}',
              //       style: TextStyle(fontSize: 16.0),
              //     );
              //   } else {
              //     return SizedBox.shrink();
              //   }
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
