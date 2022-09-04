import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hammies_user/model/reward_product.dart';
import 'package:hammies_user/screen/admin/reward/controller/manage_reward_controller.dart';

import '../../../../controller/home_controller.dart';
import '../../../../data/constant.dart';
import '../../../../routes/routes.dart';

class ManageReward extends StatefulWidget {
  const ManageReward({Key? key}) : super(key: key);

  @override
  State<ManageReward> createState() => _ManageRewardState();
}

class _ManageRewardState extends State<ManageReward> {
  final TextEditingController editingController = TextEditingController();
  final HomeController homeController = Get.find();
  @override
  void dispose() {
    homeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackground,
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () => Get.toNamed(uploadRewardScreen),
        child: Icon(FontAwesomeIcons.plus,color: Colors.white),
        ),
      appBar: AppBar(
        title: Text(
          "Manage Reward Items",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        elevation: 5,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: appBarTitleColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(child: Obx(() {
                  return SizedBox(
                    height: size.height,
                    width: size.width,
                    child: ListView(children: [
                      SizedBox(
                          height: homeController.rewardProductList.length * 140,
                          child: ListView.builder(
                            primary: false,
                            itemCount: homeController.rewardProductList.length,
                            itemBuilder: (context, index) {
                              return itemWidget(homeController.rewardProductList[index]);
                            },))
                    ]),
                  );
                })),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemWidget(RewardProduct item) {
  final HomeController homeController = Get.find();
  final ManageRewardController manageRewardController = Get.find();
  return SwipeActionCell(
    key: ValueKey(item.id),
    trailingActions: [
      SwipeAction(
        onTap: (CompletionHandler _) async {
          await _(true);
          await manageRewardController.delete(item.id);
          //setState(() {});
        },
        title: 'Delete',
      ),
      SwipeAction(
        color: Colors.grey,
        onTap: (CompletionHandler _) async {
          await _(false);
          homeController.setEditRewardItem(item);
          Get.toNamed(uploadRewardScreen);
        },
        title: 'Edit',
      ),
    ],
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 140,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              width: 100,
              height: 125,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.requirePoint.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}