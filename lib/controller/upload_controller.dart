import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hammies_user/data/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../model/item.dart';
import '../service/database.dart';
import 'home_controller.dart';

class UploadController extends GetxController {
  final RxBool isUploading = false.obs;
  var isEmptySizePrice = false.obs;
  var isEmptyDiscountPercentage = false.obs;
  final HomeController _homeController = Get.find();

  @override
  void onInit() {
    super.onInit();

    if (_homeController.editItem.value?.id.isNotEmpty == true) {
      final item = _homeController.editItem.value!;
      photoController.text = item.photo;
      photo2Controller.text = item.photo2;
      photo3Controller.text = item.photo3;
      deliverytimeController.text = item.deliverytime;
      nameController.text = item.name;
      desc.text = item.desc;
      originalPriceConttroller.text = item.originalPrice.toString();
      originalQuantityController.text = item.originalQuantity.toString();
      remainQuantityController.text = item.remainQuantity.toString();
      priceController.text = item.price.toString();
      colorController.text = item.color;
      sizeController.text = item.size;
      starController.text = item.star.toString();
      categoryController.text = item.category;
    }
  }

  final Database _database = Database();
  final ImagePicker _imagePicker = ImagePicker();
  final RxString filePath = ''.obs;
  final GlobalKey<FormState> form = GlobalKey();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController photo2Controller = TextEditingController();
  final TextEditingController photo3Controller = TextEditingController();
  final TextEditingController deliverytimeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController originalPriceConttroller = TextEditingController();
  final TextEditingController originalQuantityController = TextEditingController();
  final TextEditingController remainQuantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountpriceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController starController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
 


  Future<void> pickImage() async {
    try {
      final XFile? _file =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (_file != null) filePath.value = _file.path;
    } catch (e) {
      print("pickImage error $e");
    }
  }

  String? validator(String? data) => data?.isEmpty == true ? 'empty' : null;

  Future<void> upload() async {
    if (isUploading.value) return;
    try {
      isUploading.value = true;
      if (form.currentState?.validate() == true) {
        if (_homeController.editItem.value?.id.isNotEmpty == true) {
          await _database.update(
            productCollection,
            path: _homeController.editItem.value!.id,
            data: _homeController.editItem.value
                !.copyWith(
                   newPhoto: photoController.text,
                   newPhoto2: photo2Controller.text,
                   newPhoto3: photo3Controller.text,
                   newDeliveryTime: deliverytimeController.text,
                   newName: nameController.text,
                   des: desc.text,
                  newPrice: int.tryParse(priceController.text),
                   newColor: colorController.text,
                   newSize: sizeController.text,
                  newStar: int.tryParse(starController.text),
                   newCategory: categoryController.text,
                  originalPrice: int.tryParse(originalPriceConttroller.text),
                  originalQuantity: int.tryParse(originalQuantityController.text),
                  remainQuantity: int.tryParse(remainQuantityController.text),
                  count: 0,
                )
                .toJson(),
          );
        } else {
          await _database.write(
            productCollection,
            data: ItemModel(
                  id: Uuid().v1(),
                  photo: photoController.text,
                  photo2: photo2Controller.text,
                  photo3: photo3Controller.text,
                  deliverytime: deliverytimeController.text,
                  name: nameController.text,
                  desc: desc.text,
                  price: int.tryParse(priceController.text) ?? 0,
                  color: colorController.text,
                  size: sizeController.text,
                  star: int.tryParse(starController.text) ?? 5,
                  category: categoryController.text,
                  originalPrice: int.tryParse(originalPriceConttroller.text) ?? 0,
                  originalQuantity: int.tryParse(originalQuantityController.text)?? 0,
                  remainQuantity: int.tryParse(remainQuantityController.text)?? 0,
                  count: 0,
                )
                .toJson(),
          );
        }
        isUploading.value = false;
        Get.snackbar('Success', 'Uploaded successfully!');
        filePath.value = '';
        photoController.clear();
        photo2Controller.clear();
        photo3Controller.clear();
        deliverytimeController.clear();
        discountpriceController.clear();
        nameController.clear();
        desc.clear();
        priceController.clear();
        colorController.clear();
        sizeController.clear();
        starController.clear();
        categoryController.clear();
        originalPriceConttroller.clear();
        originalQuantityController.clear();
        remainQuantityController.clear();
        isEmptySizePrice.value = false;
        isEmptyDiscountPercentage.value = false;
        return;
      }
      isUploading.value = false;
      Get.snackbar('Required', 'Image is required');
    } catch (e) {
      isUploading.value = false;
      print("upload error $e");
    }
  }
}
