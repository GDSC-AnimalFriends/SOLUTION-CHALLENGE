import 'package:flutter/material.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0, // 앱 바 아래 그림자
        title: Text(
          '할일 추가하기',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: null,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '할 일을 입력하세요',
                ),
              ),
              Text(
                "투두페이지",
                style: inputHintStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
