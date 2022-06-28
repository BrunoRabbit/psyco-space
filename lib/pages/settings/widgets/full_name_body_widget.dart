import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';

import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class FullNameBodyWidget extends StatefulWidget {
  final SettingsController controller;

  const FullNameBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FullNameBodyWidget> createState() => _FullNameBodyWidgetState();
}

class _FullNameBodyWidgetState extends State<FullNameBodyWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                hintText: widget.controller.psychoModel.name ??
                    'Psicólogo não encontrado',
                controller: _nameController,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Preencha esse campo!';
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
                        PsychologistModel(name: _nameController.text),
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
