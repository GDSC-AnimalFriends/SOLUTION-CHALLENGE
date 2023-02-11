import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';

//예시 위젯입니다. 공통으로 쓰이는 버튼, 입력창 등을 각각 만들어주세요
class MainButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  final Color borderColor;
  const MainButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed,
      this.borderColor = black});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: borderColor,
      onPressed: () => onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class datePickButton extends StatefulWidget {
  // ⭐ 선택한 날짜가 화면에 나타나도록 구현 수정하기
  const datePickButton({super.key, required selectedDate});

  @override
  State<datePickButton> createState() => _datePickButtonState();
}

class _datePickButtonState extends State<datePickButton> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate;
    return IconButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
          builder: (BuildContext context) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: 300,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.arrow_forward_ios),
    );
  }
}
