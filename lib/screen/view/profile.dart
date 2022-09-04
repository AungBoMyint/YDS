import 'package:cached_network_image/cached_network_image.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hammies_user/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/home_controller.dart';
import '../../data/constant.dart';
import '../../utils/theme/theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return _LoginUser();
  }
}

class _LoginUser extends StatelessWidget {
  const _LoginUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 40,
            ),
            //User Profile Image
            Obx(() {
              return CachedNetworkImage(
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    radius: 40,
                    backgroundImage: imageProvider,
                  );
                },
                progressIndicatorBuilder: (context, url, status) {
                  return Shimmer.fromColors(
                    child: Container(
                      color: Colors.white,
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  );
                },
                errorWidget: (context, url, whatever) {
                  return const Text("Image not available");
                },
                imageUrl: _controller.currentUser.value?.image ?? userImage,
                //fit: BoxFit.fill,
              );
            }),

            const SizedBox(height: 5),
            //Point
            Container(
              height: 50,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Point Text
                  Obx(() {
                    return Text(
                      "${_controller.currentUser.value?.points}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: homeIndicatorColor,
                      ),
                    );
                  }),
                  const SizedBox(width: 10),
                  //Icon
                  Icon(
                    FontAwesomeIcons.coins,
                    color: Colours.goldenRod,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            //User Name
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Name   :",
                      style: TextStyle(fontSize: 20,
                        letterSpacing: 2,
                        wordSpacing: 2,
                    
                      ),),
                    ),
                    Expanded(
                      child: Text(
                        _controller.currentUser.value?.userName.toUpperCase() ?? "",
                        style: textStyleBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 5),
            //User Email
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(left: 40, right: 40,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Email   :",
                                      style: TextStyle(fontSize: 20,
                      letterSpacing: 2,
                      wordSpacing: 2,
                      ),),
                    ),
                    Expanded(
                      child: Text(
                        _controller.currentUser.value?.emailAddress ?? "",
                        style: textStyleBold.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),
          ]),
        ),
          (_controller.currentUser.value!.status! > 0) ? 
          _AdminPanel() : const SizedBox(),
           Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                 () {
                  return _controller.currentUser.value?.status == -1 ?
                   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        _controller.signInWithGoogle();
                      },
                      child: Text("Log In",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            wordSpacing: 2,
                            color: Colors.white,
                          )))
                   : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        _controller.logOut();
                      },
                      child: Text("Log Out",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            wordSpacing: 2,
                            color: Colors.white,
                          )));
                }
              ),
            ),
          //Delete
            Obx(
               () {
                return _controller.currentUser.value?.status != -1 ? Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        _controller.deleteAccount();
                      },
                      child: Text("Delete Account",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            wordSpacing: 2,
                            color: Colors.white,
                          ))),
                ) : const SizedBox();
              }
            ),
        ],
      ),
    );
  }
}

class _AdminPanel extends StatelessWidget {
  const _AdminPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: Text(
            "Admin Feature",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
           Get.toNamed(mangeItemScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Course"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
           Get.toNamed(manageRewardScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Reward Product"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
           Get.toNamed(questionFormScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Questions"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
           Get.toNamed(guideLineManagementScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage GuideLine Categories"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
           Get.toNamed(guideLineItemManagementScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage GuideLine Items"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(coursePriceScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Course Price"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
         GestureDetector(
          onTap: () {
           Get.toNamed(drivingLicenceManagementScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Driving Licence Price"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ), 
        GestureDetector(
          onTap: () {
           Get.toNamed(carLicenceManagementScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Car Licence Price"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ), 
        GestureDetector(
          onTap: () {
           Get.toNamed(enrollmentScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Enrollment Data  🎁"),
                    CircleAvatar(
                        backgroundColor: Colors.orange,
                        minRadius: 20,
                        maxRadius: 20,
                        child: Text(
                          "${controller.enrollList.length + controller.carLicenceFormList.length + controller.drivingLicenceFormList.length
                          + controller.purchaseModelList.length}",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
