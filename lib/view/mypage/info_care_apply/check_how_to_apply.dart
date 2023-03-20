import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
//import 'package:solution_challenge/view/theme/app_colors.dart';

class CheckHowToApply extends StatelessWidget {
  const CheckHowToApply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '노인맞춤돌봄서비스 신청 방법',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 8,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFFFD9D9),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow_rounded),
                          Text('노인맞춤돌봄서비스 대상자'),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Text('만 65세 이상 1)국민기초생활수급자, 2)차상위계층 또는 3)기초연금수급자로서 유사 중복사업 자격에 해당되지 않는 자'),
                            Text('· 사회관계 단절, 신체적 기능 저하, 정신적 어려움 등으로 돌봄이 필요한 노인'),
                            Text('√ 특화서비스 및 사후관리는 서비스 대상자 선정기준에 해당되지 않지만, 서비스 제공이 필요하다고 판단되는 경우 자문위원단에 특화서비스 이용 기준 예외자 승인 절차를 통해 선정가능')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
            ],

          ),
        )
      ),
    );
  }
}
