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
                      style: Theme.of(context).textTheme.displaySmall,
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
                    Obx(() => _SearchResult(
                          userSearch: controller.userSearch.value,
                          findUser: controller.searchResult.value,
                        )),
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
  final bool userSearch;
  final bool findUser;
  const _SearchResult({
    required this.userSearch,
    required this.findUser,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: userSearch,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "검색 결과",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 12),
          if (findUser)
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
                    _ResultInfo(
                      name: controller.resultUser!.name,
                      email: controller.resultUser!.email,
                      imgUrl: controller.resultUser!.imageUrl!,
                    ),
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
                ))
          else
            Column(
              children: const [
                SizedBox(height: 30),
                Text("검색 결과가 없습니다"),
              ],
            ),
        ],
      ),
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
  final String name;
  final String email;
  final String imgUrl;
  const _ResultInfo(
      {Key? key, required this.name, required this.email, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 40, 0, 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: buttonDisabled,
            radius: 40,
            child: Image.network(imgUrl),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: common22,
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: common18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
