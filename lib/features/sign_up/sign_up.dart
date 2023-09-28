import 'package:reto/commons/data/device_entity.dart';
import 'package:reto/gen/assets.gen.dart';
import 'package:reto/styles/custom_container.dart';
import 'package:reto/styles/f_text.dart';
import 'package:reto/styles/styles.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage(
      {super.key, this.onSubmitted, required this.device, this.onTap});
  final void Function(String, String, String)? onSubmitted;
  final DeviceEntity device;
  final VoidCallback? onTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Size screenSize;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.device.deviceType == DeviceType.desktop
          ? _buildDesktopView()
          : _buildMobileView(),
    );
  }

  Widget _buildMobileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createForm(
          screenSize.width,
          icon: FlutterLogo(size: screenSize.width * 0.10),
        ),
        SizedBox(height: AppSizes.size10),
        Text('Application', style: AppTextStyles.descriptionStyle)
      ],
    );
  }

  Widget _buildDesktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterLogo(size: screenSize.width * 0.10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createForm(screenSize.width * 0.3),
            SizedBox(height: AppSizes.size50),
            Text('Application', style: AppTextStyles.descriptionStyle)
          ],
        ),
      ],
    );
  }

  Widget _createForm(double width, {Widget? icon}) {
    return Container(
      padding: EdgeInsets.all(width * 0.2),
      margin: EdgeInsets.symmetric(horizontal: AppSizes.size30),
      width: width,
      child: LayoutBuilder(builder: (contex, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon,
              SizedBox(height: AppSizes.size30),
            ],
            Text('Sign Up', style: AppTextStyles.subTitleStyle),
            SizedBox(height: icon != null ? AppSizes.size20 : AppSizes.size50),
            FTextField(
              textStyle: AppTextStyles.descriptionStyle,
              autofillHints: const [AutofillHints.telephoneNumber],
              controller: nameController,
              hintText: 'admin',
              withTitle: false,
            ),
            SizedBox(height: AppSizes.size30),
            FTextField(
              textStyle: AppTextStyles.descriptionStyle,
              autofillHints: const [AutofillHints.telephoneNumber],
              controller: emailController,
              hintText: 'admin@fidooo.com',
              withTitle: false,
            ),
            SizedBox(height: AppSizes.size30),
            FTextField(
              textStyle: AppTextStyles.descriptionStyle,
              obscureText: true,
              maxLines: 1,
              controller: passwordController,
              hintText: 'password',
              onSubmitted: (String text) async {
                widget.onSubmitted?.call(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim());
              },
              withTitle: false,
            ),
            SizedBox(height: AppSizes.size50),
            FButtonContainer(
              width: constraints.maxWidth,
              textAlign: Alignment.center,
              color: const Color(0xFF3D367D),
              onTap: () {
                widget.onSubmitted?.call(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Text('Sign up',
                  style: AppTextStyles.buttonStyle.copyWith(
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: AppSizes.size10),
            FText('<b>Login</b>',
                onTap: widget.onTap, style: AppTextStyles.buttonStyle)
          ],
        );
      }),
    );
  }
}
