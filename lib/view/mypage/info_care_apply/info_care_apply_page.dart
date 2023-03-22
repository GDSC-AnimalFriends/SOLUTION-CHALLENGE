import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/apply_care_controller.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

import '../../../routes/app_pages.dart';

class InfoCareApply extends GetView<ApplyCareController> {
  const InfoCareApply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '돌봄신청 안내',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  color: lightPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
                      child: const Text(
                        '혼자\n살고 있나요?',
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 20, 20),
                      child: Container(
                          width: double.infinity,
                          child: const AutoSizeText(
                            ' 나의 할일을 함께 봐주고 도와주는 돌보미가\n 필요하신 여러분께 노인맞춤돌봄서비스로\n 도움을 드릴게요',
                            style: TextStyle(fontSize: 15, height: 1.2),
                            maxLines: 3,
                          )
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width*0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: const AssetImage('assets/images/care_picture.jpg')
                              )
                          )
                          ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                height: 1,
                width: double.maxFinite,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 10, 27, 0),
              child: Container(
                height: 105,
                width: MediaQuery.of(context).size.width*0.86,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      child: Center(
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width*0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(9, 27, 9, 7),
                        width: MediaQuery.of(context).size.width*0.84,
                      child: const Text('일상생활 영위가 어려운 취약노인에게 적절한 돌봄서비스를 제공하여 안정적인 노후생활 보장 및 노인의 기능, 건강 유지를 통한 기능악화를 예방하는 서비스입니다.',style: TextStyle(color: Colors.black54),),
                    ),
                    Positioned(
                        left: 12,
                        child: Container(
                          color: Colors.white,
                          child: const Text("         '노인맞춤돌봄서비스'란?  ",
                            style: TextStyle(
                                color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),),
                        )
                    ),
                    Positioned(
                      left: 15,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(1.0),
                                blurRadius: 2.0,
                                offset: const Offset(1,2)
                            ),
                          ],
                        ),
                        child: const Icon(Icons.question_mark,size: 15,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 17, 30, 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.CHECKAPPLY),
                      child: Container(
                        //margin: EdgeInsets.only(right: 15,bottom: 10),
                        height: MediaQuery.of(context).size.width*0.3,
                        width: MediaQuery.of(context).size.width*0.38,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD9D9),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1.0),
                              blurRadius: 5.0,
                              offset: const Offset(2,3)
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.manage_search,size: 50,),
                            const Text(
                              '신청 방법 확인하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Text(' '),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.OFFICIAL_PAGE),//Get.to(OfficialPageWebview()),
                      child: Container(
                        height: MediaQuery.of(context).size.width*0.3,
                        width: MediaQuery.of(context).size.width*0.38,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5C6),
                          borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(1.0),
                                  blurRadius: 5.0,
                                  offset: const Offset(2,3)
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.travel_explore,size: 50,),
                            const Text(
                              '노인맞춤 돌봄서비스',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '공식 페이지로 이동하기',
                              style: TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
