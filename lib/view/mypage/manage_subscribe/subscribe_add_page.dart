import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/controller/my_page/subscribe_add_controller.dart';
import 'package:solution_challenge/view/common/appbar_only_back.dart';
import 'package:solution_challenge/view/common/common_button.dart';
import 'package:solution_challenge/view/common/common_input.dart';
import 'package:solution_challenge/view/theme/app_colors.dart';
import 'package:solution_challenge/view/theme/app_text_theme.dart';

class SubscribeAddPage extends GetView<SubscribeAddController> {
  const SubscribeAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        appBar: const AppBarOnlyBack(appBarTitle: ""),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이메일로 검색해보세요",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 16),
                    CommonInput(
                      controller: controller.searchInput,
                      validation: (value) => controller.emailValidation(value),
                      hintText: "이메일",
                      inputType: TextInputType.emailAddress,
                      needHideText: false,
                    ),
                    const SizedBox(height: 24),
                    const _SearchResult(),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Obx(
                  () => CommonButton(
                    buttonColor: primaryColor,
                    textColor: white,
                    buttonText: "찾아보기",
                    onPressed: () => controller.searchEmail(),
                    enabled: controller.buttonEnabled.value,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchResult extends GetView<SubscribeAddController> {
  const _SearchResult();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "검색 결과",
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: buttonDisabled,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const _ResultInfo(),
              Row(
                children: [
                  _ResultButton(
                    buttonText: '취소',
                    style: bold24,
                    onPressed: () => controller.onCancel(),
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: buttonDisabled,
                  ),
                  _ResultButton(
                    buttonText: '구독',
                    style: boldPrimary24,
                    onPressed: () => controller.onSubscribe(),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ResultButton extends StatelessWidget {
  final String buttonText;
  final TextStyle style;
  final GestureTapCallback onPressed;
  const _ResultButton({
    required this.buttonText,
    required this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
              child: Text(
            buttonText,
            style: style,
          )),
        ),
      ),
    );
  }
}

class _ResultInfo extends StatelessWidget {
  const _ResultInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 40, 0, 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CircleAvatar(
            backgroundColor: buttonDisabled,
            radius: 40,
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "안승우",
                style: common22,
              ),
              SizedBox(height: 4),
              Text(
                "rio970319@gmail.com",
                style: common18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
