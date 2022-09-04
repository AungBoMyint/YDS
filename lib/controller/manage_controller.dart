import 'package:get/get.dart';
import 'package:hammies_user/service/database.dart';
import 'package:hammies_user/widgets/show_loading/show_loading.dart';

import '../data/constant.dart';

class ManageController extends GetxController{
  final Database _database = Database();
  Future<void> delete(String id) async{
    showLoading();
    await _database.delete(productCollection, path: id);
    hideLoading();
  }
}