import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

class InfoCareApply extends StatefulWidget {
  const InfoCareApply({Key? key}) : super(key: key);

  @override
  State<InfoCareApply> createState() => _InfoCareApplyState();
}

class _InfoCareApplyState extends State<InfoCareApply> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '돌봄신청 안내',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('혼자\n살고 있나요?',style: TextStyle(fontSize: 35),),
                    Text('나의 할일을 함께 봐주고 도와주는 돌보미가 \n필요하신 여러분께 노인맞춤돌봄서비스로 \n도움을 드릴게요'),
                    Container(
                      height: 145,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/care_picture.jpg')
                            )
                        )
                        )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
              child: Container(
                height: 1,
                width: double.maxFinite,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 10, 27, 10),
              child: Container(
                height: 95,
                width: double.maxFinite,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(27, 17, 27, 0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 140,
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
                            Icon(Icons.manage_search,size: 70,),
                            Text(
                              '신청 방법 확인하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(' '),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 140,
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
                            Icon(Icons.travel_explore,size: 70,),
                            Text(
                              '노인맞춤 돌봄서비스',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
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
