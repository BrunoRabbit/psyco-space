import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/app/utils/valid_utils.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class EmailBodyWidget extends StatefulWidget {
  final SettingsController controller;

  const EmailBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailBodyWidget> createState() => _EmailBodyWidgetState();
}

class _EmailBodyWidgetState extends State<EmailBodyWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controllerEmail;
  @override
  void initState() {
    _controllerEmail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
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
                hintText: widget.controller.psychoModel.email ??
                    'Email não encontrado',
                controller: _controllerEmail,
                textInputType: TextInputType.emailAddress,
                validator: (text) {
                  if (ValidUtils.validEmail(text!) && text.isNotEmpty) {
                    return null;
                  }
                  return 'Email incorreto';
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
                        PsychologistModel(email: _controllerEmail.text),
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
