import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../data/constant.dart';
import '../routes/routes.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
       titleSpacing: 5,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Driving Courses",
                  style: TextStyle(
                    overflow: TextOverflow.visible,
                    color: Colors.black,
                      fontSize: 16,
                      wordSpacing: 2,
                      letterSpacing: 2),
                ),
            ),
            
          ],
        )),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: controller.items.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              controller.setSelectedItem(controller.items[i]);
              Get.toNamed(detailScreen);
            },
          child:  Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            // color: Colors.blueAccent,
            height: 160,
            child: InkWell(
              onTap: (){
                controller.setSelectedItem(controller.items[i]);
                Get.toNamed(detailScreen);
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  // Those are our background
                  Container(
                    height: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: i.isEven ? kBlueColor : kSecondaryColor,
                      boxShadow: [kDefaultShadow],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  // our product image
                  Positioned(
                    top: 0,
                    right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          height: 180,
                          // image is square but we add extra 20 + 20 padding thats why width is 200
                          width: 180,
                              child: Card(
                                color: i.isEven ? kBlueColor : kSecondaryColor,
                                child: Hero(
                                  tag: controller.items[i].photo,
                                child: Image.network(
                                  controller.items[i].photo,
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.contain,
                                ),
                                                          ),
                              ),
                        ),
                      ),
                  // Product title and price
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      height: 136,
                      // our image take 200 width, thats why we set out total width - 200
                      width: size.width - 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Text(
                              controller.items[i].name,
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                      SizedBox(
                        height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18),
                                        child: Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              Icons.star,
                                              size: 15,
                                              color: index <= controller.items[i].star
                                                  ? homeIndicatorColor
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                          // it use the available space
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5, // 30 padding
                              vertical: kDefaultPadding / 4, // 5 top and bottom
                            ),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),
                            ),
                            child: Text(
                              "${controller.items[i].price} Ks",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
