import 'package:get/get.dart';
import 'package:hammies_user/service/database.dart';

import '../../../../data/constant.dart';

class ManageRewardController extends GetxController{
  final Database _database = Database();
  Future<void> delete(String id)async{
    await _database.delete(rewardProductCollection, path: id);
  }
}