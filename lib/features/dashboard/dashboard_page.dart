import 'package:flutter/material.dart';
import 'package:reto/styles/custom_container.dart';
import 'package:reto/styles/test_styles.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, this.onTap, this.navigation, this.child});
  final VoidCallback? onTap;
  final void Function(String)? navigation;
  final Widget? child;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          color: Color.fromARGB(255, 205, 200, 246),
          height: double.infinity,
          width: 300,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 20),
                    FButtonContainer(
                      width: double.infinity,
                      textAlign: Alignment.center,
                      color: const Color(0xFF3D367D),
                      onTap: () {
                        widget.navigation?.call('user');
                      },
                      child: Text('User',
                          style: AppTextStyles.buttonStyle.copyWith(
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(height: 10),
                    FButtonContainer(
                      width: double.infinity,
                      textAlign: Alignment.center,
                      color: const Color(0xFF3D367D),
                      onTap: () {
                        widget.navigation?.call('retrofit');
                      },
                      child: Text('Retrofit',
                          style: AppTextStyles.buttonStyle.copyWith(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FButtonContainer(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                textAlign: Alignment.center,
                color: Colors.red,
                onTap: widget.onTap,
                child: Text('Salir',
                    style: AppTextStyles.buttonStyle.copyWith(
                      color: Colors.white,
                    )),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Expanded(
          child: Container(color: Colors.red.shade100, child: widget.child),
        ),
      ],
    ));
  }
}
