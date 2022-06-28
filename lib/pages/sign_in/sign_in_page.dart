import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/utils/valid_utils.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/controllers/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController(text: 'luisbruno123@gmail.com');
    _passwordController = TextEditingController(text: '123456');
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignInController _signInController =
        Provider.of<SignInController>(context);
    final _pacientsController = Provider.of<PacientController>(context);
    final SettingsController _settingsController =
        Provider.of<SettingsController>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(
                    0.1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      SvgPicture.asset(
                        'assets/images/sign_in.svg',
                        height: 220,
                      ),
                      Text(
                        'Acesse sua conta',
                        style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(
                            0.7,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AppTextFieldWidget(
                        hintText: 'E-mail',
                        controller: _emailController,
                        validator: (text) {
                          if (ValidUtils.validEmail(text!) && text.isNotEmpty) {
                            return null;
                          }
                          return 'Email incorreto';
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppTextFieldWidget(
                        hintText: 'Senha',
                        controller: _passwordController,
                        validator: (text) {
                          if (text!.isNotEmpty) {
                            return null;
                          }
                          return 'Senha não pode ser vazia';
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            'Esqueci minha senha',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppElevatedButtonWidget(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await _signInController.signIn(
                                  _emailController.text,
                                  _passwordController.text,
                                  context,
                                ) ==
                                false) {
                            } else {}
                          }
                        },
                        label: 'Entrar',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
