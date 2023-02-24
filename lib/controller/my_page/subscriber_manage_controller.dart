import 'package:get/get.dart';

class SubscriberManageController extends GetxController {
  final List<String> subscribers = <String>['승우','여경'];
  final List<bool> isSelected = [false, false, false];
  //List<bool> selections = List.generate(2, (_)=>false );
  final listTextTabToggle = ["수정허용", "수정거부"];

  RxInt tabTextIndexSelected = 0.obs;

  toggle(int index) => tabTextIndexSelected.value = index;

}