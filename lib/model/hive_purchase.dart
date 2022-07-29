import 'package:hive/hive.dart';

import 'hive_purchase_item.dart';
import 'hive_reward_product.dart';

part 'hive_purchase.g.dart';

@HiveType(typeId: 5)
class HivePurchase {
  @HiveField(0)
  List<HivePurchaseItem>? items;
  @HiveField(1)
  int totalPrice;
  @HiveField(2)
  List deliveryTownshipInfo;
  @HiveField(3)
  DateTime dateTime;
  @HiveField(4)
  String id;
  @HiveField(5)
  List<HiveRewardProduct>? rewardProductList;
  HivePurchase({
    required this.items,
    required this.totalPrice,
    required this.deliveryTownshipInfo,
    required this.dateTime,
    required this.id,
    required this.rewardProductList,
  });
}
