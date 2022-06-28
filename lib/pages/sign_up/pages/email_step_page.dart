import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/utils/valid_utils.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/controllers/sign_up_controller.dart';
import 'package:psyco_space/models/psychologist_model.dart';

import '../../../app/widgets/app_elevated_button_widget.dart';

class EmailStepPage extends StatefulWidget {
  const EmailStepPage({Key? key}) : super(key: key);

  @override
  _EmailStepPageState createState() => _EmailStepPageState();
}

class _EmailStepPageState extends State<EmailStepPage> {
  late final FocusNode _emailInputFocus;
  late final TextEditingController _emailEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailInputFocus = FocusNode();
    _emailInputFocus.requestFocus();
    _emailEditingController =
        TextEditingController(text: 'luisbruno123@gmail.com');
    super.initState();
  }

  @override
  void dispose() {
    _emailInputFocus.dispose();
    _emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formController = Provider.of<FormController>(context);
    final _controller = Provider.of<SignUpController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Para começar digite seu melhor e-mail!',
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(
                  0.7,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: _emailEditingController,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                        ),
                        focusNode: _emailInputFocus,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (ValidUtils.validEmail(text!) && text.isNotEmpty) {
                            return null;
                          }
                          return 'Email incorreto';
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          hintText: 'E-mail',
                          hintStyle: GoogleFonts.rubik(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AppElevatedButtonWidget(
                size: 100,
                onTap: () {
                  _emailInputFocus.unfocus();
                  if (_formKey.currentState!.validate()) {
                    _controller.setEmailSep(
                      PsychologistModel(
                        email: _emailEditingController.text,
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
