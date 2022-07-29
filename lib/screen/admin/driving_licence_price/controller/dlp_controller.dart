import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hammies_user/data/constant.dart';
import 'package:hammies_user/model/price/cost.dart';
import 'package:uuid/uuid.dart';

import '../../../../service/database.dart';
import '../../../../widgets/show_loading/show_loading.dart';

class DLPController extends GetxController{
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<Cost> cost = Rxn<Cost>();
  final _database = Database();
  var isLoading = true.obs;

  String? validate(String? value){
    if(!(value == null) && value.isNotEmpty){
      return null;
    }
    return "Fill";
  }

  Future<void> addCost() async{
   if(formKey.currentState!.validate() && (cost.value == null)){
     final costData = Cost(
     id: Uuid().v1(),
     desc: descController.text, 
     cost: int.parse(priceController.text.removeAllWhitespace), 
    );
    showLoading();
    await _database.write(drivingLicenceCostCollection,
    path: costData.id,
    data: costData.toJson(),
    );
    cost.value = costData; 
    hideLoading();
    priceController.clear();
    descController.clear();
   }
  }

  Future<void> deletePrice(String id) async{
    showLoading();
    await _database.delete(drivingLicenceCostCollection, 
    path: id,
    );
    cost.value = null;
    hideLoading();
  }
  
  @override
  void onInit() async{
    super.onInit();
    //Request Price First Time
    _database.readCollection(drivingLicenceCostCollection)
    .then((value){
      if(value.docs.isNotEmpty){
        cost.value = Cost.fromJson(value.docs.first.data());
        isLoading.value = false;
      }else{
        isLoading.value = false;
      }
    });
    
  }
}