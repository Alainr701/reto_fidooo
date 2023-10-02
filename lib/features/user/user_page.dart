import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:reto/styles/f_text.dart';
import 'package:reto/styles/styles.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
    this.onSubmitted,
  });
  final void Function(String, String, String, String, String)? onSubmitted;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    stateController.dispose();
    dateController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAttach(context);
          },
          child: const Text('data'),
        ),
      ),
    );
  }

  void _showAttach(BuildContext ctx) {
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          height: 480,
          width: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FText('Preguntas de Usuario'),
                const SizedBox(height: 10),
                FTextField(
                  textStyle: AppTextStyles.descriptionStyle,
                  controller: nameController,
                  hintText: 'Nombre Completo',
                  withTitle: true,
                ),
                const SizedBox(height: 10),
                FTextField(
                  textStyle: AppTextStyles.descriptionStyle,
                  controller: ageController,
                  hintText: 'Edad',
                  withTitle: true,
                ),
                const SizedBox(height: 10),
                FTextField(
                  textStyle: AppTextStyles.descriptionStyle,
                  controller: stateController,
                  hintText: 'Estado Civil',
                  withTitle: true,
                ),
                const SizedBox(height: 10),
                FTextField(
                  textStyle: AppTextStyles.descriptionStyle,
                  controller: dateController,
                  hintText: 'Fecha de Nacimiento',
                  withTitle: true,
                ),
                const SizedBox(height: 10),
                FTextField(
                  textStyle: AppTextStyles.descriptionStyle,
                  controller: genderController,
                  hintText: 'Genero',
                  withTitle: true,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              ageController.text.isNotEmpty &&
                              stateController.text.isNotEmpty &&
                              genderController.text.isNotEmpty) {
                            SmartDialog.dismiss();
                            widget.onSubmitted!(
                              nameController.text,
                              ageController.text,
                              stateController.text,
                              dateController.text,
                              genderController.text,
                            );
                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => SmartDialog.dismiss(),
                        child: const Text('Salir'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
