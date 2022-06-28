import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class PasswordBodyWidget extends StatefulWidget {
  final SettingsController controller;

  const PasswordBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordBodyWidget> createState() => _PasswordBodyWidgetState();
}

class _PasswordBodyWidgetState extends State<PasswordBodyWidget> {
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordController = TextEditingController(text: '1234567');
    _repeatPasswordController = TextEditingController(text: '1234567');
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Mudar configurações',
                style: GoogleFonts.rubik(
                    fontSize: 20, color: Colors.black.withOpacity(0.65)),
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextFieldWidget(
                hintText: 'Senha nova',
                controller: _passwordController,
                isObscureText: true,
                validator: (text) {
                  if ((text!.isEmpty || text == ' ') || text.length < 6) {
                    return text.length < 6
                        ? 'Senha incorreta'
                        : 'Senha não pode ser menor que 6 caracteres';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextFieldWidget(
                hintText: 'Repetir senha',
                controller: _repeatPasswordController,
                isObscureText: true,
                validator: (text) {
                  if (_passwordController.text !=
                      _repeatPasswordController.text) {
                    return 'Senhas não coincidem';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              AppElevatedButtonWidget(
                label: 'Salvar',
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (await widget.controller.changePsychologyst(
                        PsychologistModel(password: _passwordController.text),
                        context)) {
                      sucessSnackBar('Mudado com sucesso!', context);
                      Navigator.pop(context);
                    } else {
                      failedSnackBar('Algo deu errado!', context);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
