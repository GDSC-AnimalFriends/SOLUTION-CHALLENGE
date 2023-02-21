import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

import '../common/appbar_only_back.dart';
import '../common/button_widget.dart';
import '../theme/app_colors.dart';

const List<Widget> state = <Widget>[
  // 알림
  Text('ON'),
  Text('OFF'),
];

const List<Widget> dayOfTheWeek = <Widget>[
  Text('월'),
  Text('화'),
  Text('수'),
];

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarOnlyBack(
        appBarTitle: '할일 추가하기',
      ),
      body: SafeArea(
        child: Column(
          children: [
            _PutTodo(),
            DatePick(),
            _Repeat(),
            _AssignTodo(),
            _AlarmOnOff(),
            _PutTodoInfo(),
            _DoneButton(),
          ],
        ),
      ),
    );
  }

  Expanded _PutTodoInfo() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 14),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '할 일 설명을 입력하세요',
              labelStyle: textfieldInfo),
        ),
      ),
    );
  }

  Container _AlarmOnOff() {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        // 위 아래 테두리
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Text('알림', style: todoPageText)]),
          ToggleButton()
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
                    style: todoPageText,
                  ),
                  Text('나', style: todoPageText) // ⭐ 선택하는 것에 따라 바뀌게
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 300,
                        child: Text(
                          '구현하기',
                          style: todoPageText,
                        )),
                  );
                },
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }

  Container _PutTodo() {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      height: 80,
      child: Center(
        child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, // ⭐ 위에만 border 넣는 방법 알아보기
                labelText: '할 일을 입력하세요',
                labelStyle: textfieldInfo)),
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
                  Text('반복: ', style: todoPageText),
                  Text('없음', style: todoPageText) // ⭐ 선택하는 것에 따라 바뀌게
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                barrierDismissible: true, // 다른 부분 클릭하면 꺼짐
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 300,
                        child: Text(
                          '구현하기',
                          style: todoPageText,
                        )),
                  );
                },
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }

  Padding _DoneButton() {
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
}

class ToggleButton extends StatefulWidget {
  // ⭐ 토글 버튼 수정해야됨
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final List<bool> _isSelected = <bool>[false, true];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _isSelected.length; i++) {
            _isSelected[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      selectedBorderColor: Colors.blue[700],
      selectedColor: Colors.white,
      fillColor: primaryColor,
      color: primaryColor,
      isSelected: _isSelected,
      children: state,
    );
  }
}

class DatePick extends StatefulWidget {
  const DatePick({super.key});

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
                      '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                      style: todoPageText),
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
}

class RepeatPickButton extends StatefulWidget {
  const RepeatPickButton({super.key});

  @override
  State<RepeatPickButton> createState() => _RepeatPickButtonState();
}

class _RepeatPickButtonState extends State<RepeatPickButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
