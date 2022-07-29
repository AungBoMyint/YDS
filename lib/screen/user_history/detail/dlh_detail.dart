import 'package:flutter/material.dart';
import 'package:hammies_user/model/form/driving_licence_form.dart';

import '../../../utils/utils.dart';
import '../../../utils/widget/widget.dart';

class DLHDetail extends StatelessWidget {
  final DrivingLicenceForm drivingLicenceForm;
  const DLHDetail({Key? key,required this.drivingLicenceForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "History Detail"),
      body: ListView(
        children: [
          FormRowWidget(
            label: "လိုင်စင်အမှတ်: ",
            value: drivingLicenceForm.licenceNo ?? "",
          ),
          FormRowWidget(
            label: "လိုင်စင်ကုန်ဆုံးရက်: ",
            value: drivingLicenceForm.licenceExpiredDate ?? "",
          ),
          FormRowWidget(
            label: "ဆောင်ရွက်လိုသောလိုင်စင်: ",
            value: drivingLicenceForm.licenceType,
          ),
          FormRowWidget(
            label: "ဆောင်ရွက်လိုသောာဝန်ဆောင်မှု: ",
            value: drivingLicenceForm.serviceType,
          ),
          FormRowWidget(
            label: "သင်တန်းကြေး: ",
            value: "${drivingLicenceForm.cost}ks",
          ),
        ],
      ),
    );
  }
}