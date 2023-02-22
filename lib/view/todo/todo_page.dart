import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

import '../../controller/todo/todo_controller.dart';
import '../common/appbar_with_bottom_line.dart';
import '../theme/app_colors.dart';
import 'todo_alram_toggle_button.dart';

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
      appBar: AppBarWithBottomLine(appBarTitle: '할일 추가하기'),
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
            color: TodoBorder,
            width: 1,
          ),
          bottom: BorderSide(
            color: TodoBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Text('알림', style: todoPageText)]),
          AlramToggleButton(),
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
            color: TodoBorder,
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
              labelStyle: textfieldInfo),
        ),
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
            color: TodoBorder,
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
    // ⭐ common Button 사용하기!
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
            color: TodoBorder,
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
