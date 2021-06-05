import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_app_common_button.dart';

class BottomRowButton extends StatelessWidget {
  const BottomRowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("${size.height}");
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 40,
        right: 20,
        bottom: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: AppCommonButton(
              heightButton: 35,
              textButton: 'Sign In',
              onPress: () {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: AppCommonButton(
              widthButton: double.infinity,
              heightButton: 35,
              borderColor: AppColors.greenColor,
              backgroundColor: AppColors.black,
              textColor: AppColors.greenColor,
              textButton: 'Sign up',
              onPress: () {
                showSignUpDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void showSignUpDialog(BuildContext context) {
    List<String> textButtonList = [
      'SIGN UP with Invitation Code',
      'SIGN UP with Email',
      'SIGN UP with Google',
      'SIGN UP with Facebook',
      'SIGN UP with Apple'
    ];
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (_) {
        return Stack(
          children: [
            Positioned(
              left: 15,
              right: 40,
              bottom: 40,
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 30,
                  top: 20,
                  bottom: 30,
                ),
                height: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blackColor,
                ),
                child: Column(
                  children: <Widget>[
                    TopTextWidget(),
                    Expanded(
                      child: ListSignUpButton(
                        textButtonList: textButtonList,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 33,
              right: 33,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ListSignUpButton extends StatelessWidget {
  const ListSignUpButton({
    Key? key,
    required this.textButtonList,
  }) : super(key: key);

  final List<String> textButtonList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: textButtonList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 23 : 12,
          ),
          child: AppCommonButton(
            heightButton: 36,
            textButton: textButtonList[index],
            onPress: () {
              switch (index) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  break;
              }
            },
            backgroundColor: AppColors.greenColor,
            textColor: AppColors.blackColor,
            borderColor: AppColors.greenColor,
          ),
        );
      },
    );
  }
}

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'By signing up, you agree to Zporters\n'),
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("Tap terms");
              },
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Privacy Rules',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("Tap Privacy");
              },
          ),
        ],
        style: TextStyle(
          fontSize: 14,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
