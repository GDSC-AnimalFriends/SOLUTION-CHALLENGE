import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

import '../theme/app_colors.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _PutTodo(),
            _DatePick(),
            _Repeat(),
            _AssignTodo(),
            _AlarmOnOff(),
            _PutTodoInfo(),
            DoneButton(),
          ],
        ),
      ),
    );
  }

  Expanded _PutTodoInfo() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: '할 일 설명을 입력하세요',
        ),
      ),
    );
  }

  Container _AlarmOnOff() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: grey,
            width: 1,
          ),
          bottom: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 14),
          Text(
            '알림',
            style: TextStyle(
              fontSize: 22,
            ),
          ), /*
                ToggleButtons(children: <Widget>[
                  Icon(Icons.bluetooth),
                  Icon(Icons.wifi),
                  Icon(Icons.flash_on),
                ], isSelected: _isSelected) => isSelected 를 선언해야하는듯?*/
        ],
      ),
    );
  }

  Container _AssignTodo() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 14),
                  Text(
                    '누구의 할일: ',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )
            ],
          ),
          datePickButton(
            selectedDate: selectedDate, // ⭐ DatePick 대신!! 구독자 배정하기
          ),
        ],
      ),
    );
  }

  Container _PutTodo() {
    return Container(
      width: double.infinity,
      height: 80,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, // ⭐ 위에만 border 넣는 방법 알아보기
              labelText: '   할 일을 입력하세요',
              labelStyle: TextStyle(fontSize: 22, color: grey)
              /* ⭐ sizedBox를 Row로 같이 하면 에러가 나서 일단은 텍스트로 띄워줬음 */
              ),
        ),
      ),
    );
  }

  Container _DatePick() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 14),
                  Text(
                    '(날짜선택)',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )
            ],
          ),
          datePickButton(
            selectedDate: selectedDate,
          ),
        ],
      ),
    );
  }

  Container _Repeat() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 14),
                  Text(
                    '반복: ',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )
            ],
          ),
          datePickButton(
            selectedDate: selectedDate, // ⭐ DatePick 대신!! 예, 아니오 선택 구현하기
          ),
        ],
      ),
    );
  }

  Padding DoneButton() {
    // ⭐ 버튼으로 구현하기
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor,
        ),
        child: Center(
          child: Text("완료하기", style: doneButtonStyle),
        ),
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      elevation: 0, // 앱 바 아래 그림자
      title: Text(
        '할 일 추가하기',
        style: TextStyle(color: black, fontSize: 22),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: black,
        ),
        onPressed: () {}, // ⭐ 뒤로가기 버튼 누르면 뒤로가도록 구현
      ),
    );
  }
}

class datePickButton extends StatefulWidget {
  // ⭐ 선택한 날짜가 화면에 나타나도록 구현하기
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
