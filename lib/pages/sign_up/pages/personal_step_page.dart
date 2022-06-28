// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/controllers/sign_up_controller.dart';
import 'package:psyco_space/models/psychologist_model.dart';

import '../../../app/widgets/app_elevated_button_widget.dart';
import '../../../app/widgets/app_text_field_widget.dart';

class PersonalStepPage extends StatefulWidget {
  const PersonalStepPage({Key? key}) : super(key: key);

  @override
  State<PersonalStepPage> createState() => _PersonalStepPageState();
}

class _PersonalStepPageState extends State<PersonalStepPage> {
  late final FocusNode _userInputFocus;
  late final TextEditingController _nameEditingController;
  late final TextEditingController _passwordEditingController;
  late final TextEditingController _confirmPasswordEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameEditingController = TextEditingController(text: 'Luis Bruno Monteiro');
    _passwordEditingController = TextEditingController(text: '123456');
    _confirmPasswordEditingController = TextEditingController(text: '123456');
    _userInputFocus = FocusNode();
    _userInputFocus.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _confirmPasswordEditingController.dispose();
    _passwordEditingController.dispose();
    _nameEditingController.dispose();
    _userInputFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<SignUpController>(context);
    final _formController = Provider.of<FormController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Para começar vamos precisar de alguns dados pessoais',
                    style: GoogleFonts.rubik(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  AppTextFieldWidget(
                    controller: _nameEditingController,
                    validator: (text) {
                      if (text!.isEmpty || text == ' ') {
                        return 'Nome não pode ser vazio';
                      }
                      return null;
                    },
                    textInputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z]'),
                      ),
                      FilteringTextInputFormatter.deny(
                        RegExp('[0-9]'),
                      ),
                    ],
                    hintText: 'Nome completo',
                    textInputType: TextInputType.name,
                    focusNode: _userInputFocus,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Senha',
                    isObscureText: true,
                    controller: _passwordEditingController,
                    textInputType: TextInputType.visiblePassword,
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
                    height: 20,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Confirmar senha',
                    isObscureText: true,
                    controller: _confirmPasswordEditingController,
                    validator: (text) {
                      if (_passwordEditingController.text !=
                          _confirmPasswordEditingController.text) {
                        return 'Senhas não coincidem';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AppElevatedButtonWidget(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _controller.setPersonalStep(
                      PsychologistModel(
                        name: _nameEditingController.text,
                        password: _passwordEditingController.text,
                      ),
                    );
                    _formController.changeIndex();
                  }
                },
                label: 'Próximo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
