import 'package:get/get.dart';

class SubscriberManageController extends GetxController {
  final List<String> subscribers = <String>['승우','여경','지수'];
  final List<RxInt> subscriberButtonIndex = <RxInt>[0.obs,0.obs,0.obs];
  final listTextTabToggle = ["수정허용", "수정거부"];

  List<Data> data = [
    Data(
      title: 'Tile 1',
      description: 'Description for Tile 1',
    ),
    Data(
      title: 'Tile 2',
      description: 'Description for Tile 2',
    ),
    Data(
      title: 'Tile 3',
      description: 'Description for Tile 3',
    ),
  ];
}

class Data {
  final String title;
  final String description;

  Data({required this.title, required this.description});
}


