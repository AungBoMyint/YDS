import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hammies_user/screen/user_history/controller/user_history_controller.dart';
import 'package:hammies_user/screen/user_history/detail/cfh_detail.dart';
import 'package:hammies_user/screen/user_history/detail/clh_detail.dart';
import 'package:hammies_user/screen/user_history/detail/dlh_detail.dart';
import 'package:intl/intl.dart';

import '../../../data/constant.dart';
import '../../../utils/utils.dart';

class UserHistoryView extends StatelessWidget {
  const UserHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserHistoryController _controller = Get.find();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: appBarColor,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              elevation: 0,
              title: Text("History",
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: Colors.black,
                            fontSize: 16,),
                      ),
                      bottom: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: "Course",
                          ),
                          Tab(
                            text: "Car Licence",
                          ),
                          Tab(
                            text: "Driving Licence",
                          ),
                        ],
                        ),
        ),
         body: TabBarView(
          children: [
            //Course
            CourseFormList(),
            //CarLicence
            CarLicenceFormList(),
            //DrivingLicence
            DrivingLicenceFormList(),
          ],
        ),
      ),
    );
  }
}

class CourseFormList extends StatelessWidget {
  const CourseFormList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserHistoryController _controller = Get.find();
    return Obx((){
      if(_controller.isCourseLoading.value){
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );
      }
      if(_controller.courseFormList.isEmpty){
        return const Center(child: Text("No Courses yet!."),);
      }
      return ListView.builder(
        itemCount: _controller.courseFormList.length,
        itemBuilder: (context,index){
          final course = _controller.courseFormList[index];
          return Card(
            child: ListTile(
              onTap: () => Get.to(() => CFHDetail(courseForm: course)),
              title: Text(
                "သင်တန်းအမျိုးအစား => ${course.courseType}",
              ),
              subtitle: Text(
                "စတက်သည့်ရက် => ${getDate(course.initialDay)}"
              ),
              trailing: Text(
                "${getDate(course.dateTime)}"
              ),
            ),
          );
        },
      );
    });
  }
}

class CarLicenceFormList extends StatelessWidget {
  const CarLicenceFormList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserHistoryController _controller = Get.find();
    return Obx((){
      if(_controller.isCarLoading.value){
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );
      }
      if(_controller.carLicenceFormList.isEmpty){
        return const Center(child: Text("No car licnece yet!."),);
      }
      return ListView.builder(
        itemCount: _controller.carLicenceFormList.length,
        itemBuilder: (context,index){
          final course = _controller.carLicenceFormList[index];
          return Card(
            child: ListTile(
              onTap: () => Get.to(() => CLHDetail(carLicenceForm: course)),
              title: Text(
                "ကားအင်ဂျင်ပါဝါ => ${course.enginPowerType}",
              ),
              trailing: Text(
                "${getDate(course.dateTime)}"
              ),
            ),
          );
        },
      );
    });
  }
}

class DrivingLicenceFormList extends StatelessWidget {
  const DrivingLicenceFormList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserHistoryController _controller = Get.find();
    return Obx((){
      if(_controller.isDrivingLoading.value){
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );
      }
      if(_controller.drivingLicenceFormList.isEmpty){
        return const Center(child: Text("No driving licence yet!."),);
      }
      return Obx(
         () {
          return ListView.builder(
            itemCount: _controller.drivingLicenceFormList.length,
            itemBuilder: (context,index){
              final course = _controller.drivingLicenceFormList[index];
              return Card(
                child: ListTile(
                  onTap: () => Get.to(() => DLHDetail(drivingLicenceForm: course)),
                  title: Text(
                    "လိုင်စင် => ${course.licenceType}",
                  ),
                  subtitle: Text(
                    "ဝန်ဆောင်မှု => ${course.serviceType}"
                  ),
                  trailing: Text(
                    "${getDate(course.dateTime)}"
                  ),
                ),
              );
            },
          );
        }
      );
    });
  }
}