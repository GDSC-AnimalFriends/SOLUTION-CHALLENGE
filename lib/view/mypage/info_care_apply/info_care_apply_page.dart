import 'package:flutter/material.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';

class InfoCareApply extends StatefulWidget {
  const InfoCareApply({Key? key}) : super(key: key);

  @override
  State<InfoCareApply> createState() => _InfoCareApplyState();
}

class _InfoCareApplyState extends State<InfoCareApply> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: AppBarOnlyBack(
          appBarTitle: '돌봄신청 안내',
        ),
      ),
    );
  }
}
