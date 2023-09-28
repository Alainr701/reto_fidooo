import 'package:reto/commons/data/device_entity.dart';
import 'package:reto/gen/assets.gen.dart';
import 'package:reto/styles/styles.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onSubmitted, required this.device});
  final void Function(String, String, String)? onSubmitted;
  final DeviceEntity device;

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
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.images.loginBg.path))),
        child: widget.device.deviceType == DeviceType.desktop
            ? _buildDesktopView()
            : _buildMobileView(),
      ),
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
              textinputType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.telephoneNumber],
              controller: nameController,
              title: 'Name',
              hintText: 'admin',
              withTitle: false,
            ),
            SizedBox(height: AppSizes.size30),
            FTextField(
              textStyle: AppTextStyles.descriptionStyle,
              textinputType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.telephoneNumber],
              controller: emailController,
              title: 'Email',
              hintText: 'admin@fidooo.com',
              withTitle: false,
            ),
            SizedBox(height: AppSizes.size30),
            FTextField(
              textStyle: AppTextStyles.descriptionStyle,
              obscureText: true,
              maxLines: 1,
              controller: passwordController,
              title: 'Password',
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
            SizedBox(
              width: constraints.maxWidth,
              child: ElevatedButton(
                onPressed: () async {
                  widget.onSubmitted?.call(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Container(
                    margin: EdgeInsets.all(AppSizes.size10),
                    child: Text('Sign Up', style: AppTextStyles.buttonStyle)),
              ),
            ),
            SizedBox(height: AppSizes.size10),
            Text('Forgot <b>password</b>', style: AppTextStyles.buttonStyle)
          ],
        );
      }),
    );
  }
}
