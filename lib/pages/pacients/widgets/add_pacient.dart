import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/pages/archives/tabs/personal/widgets/personal_title.dart';

class AddPacient extends StatefulWidget {
  const AddPacient({Key? key}) : super(key: key);

  @override
  State<AddPacient> createState() => _AddPacientState();
}

class _AddPacientState extends State<AddPacient> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _sobrenomeController;
  late TextEditingController _birthdayController;
  late TextEditingController _cityController;
  late TextEditingController _bairroController;
  late TextEditingController _numberController;
  late TextEditingController _emailController;
  late TextEditingController _cellphoneController;
  late TextEditingController _telefoneController;
  late TextEditingController _firstSectionController;

  @override
  void initState() {
    _nameController = TextEditingController(text: 'Josias');
    _sobrenomeController = TextEditingController(text: 'Martins Castro');
    _birthdayController = TextEditingController(text: '10/12/1975');
    _cityController = TextEditingController(text: 'Guarulhos');
    _bairroController = TextEditingController(text: 'Santa Luzia');
    _numberController = TextEditingController(text: '12');
    _emailController = TextEditingController(text: 'josiasmartins@gmail.com');
    _cellphoneController = TextEditingController(text: '(12) 8158-4856');
    _telefoneController = TextEditingController(text: '(12) 3133-5555');
    _firstSectionController = TextEditingController(text: '04/08/2016');
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _sobrenomeController.dispose();
    _birthdayController.dispose();
    _cityController.dispose();
    _bairroController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _cellphoneController.dispose();
    _telefoneController.dispose();
    _firstSectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _pacientsController = Provider.of<PacientController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
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
                      Icons.cancel,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Adicione um paciente',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PersonalTitle(
                          leading: 'Informações pessoais',
                          icon: Icons.person_pin_rounded,
                          fontSize: 20,
                          iconSize: 22,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Nome',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _nameController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Nome nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Sobrenome',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _sobrenomeController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Sobrenome nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Aniversário',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _birthdayController,
                          hintText: '',
                          textInputType: TextInputType.datetime,
                          textInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Aniversário nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Data da ultima sessão',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _firstSectionController,
                          hintText: '',
                          textInputType: TextInputType.datetime,
                          textInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Sessão nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const PersonalTitle(
                          leading: 'Endereço',
                          icon: Icons.home_rounded,
                          fontSize: 20,
                          iconSize: 22,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Cidade',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _cityController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Cidade nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Bairro',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _bairroController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Bairro nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Numero',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _numberController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Numero nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const PersonalTitle(
                          leading: 'Contato',
                          icon: Icons.phone_rounded,
                          fontSize: 20,
                          iconSize: 22,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'E-mail',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _emailController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'E-mail nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Celular',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _cellphoneController,
                          hintText: '',
                          textInputType: TextInputType.number,
                          textInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Celular nao pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Telefone',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppTextFieldWidget(
                          controller: _telefoneController,
                          hintText: '',
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Telefone nao pode ser vazio';
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                          textInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppElevatedButtonWidget(
                          label: 'Salvar',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (await _pacientsController.addPacientFirebase(
                                PacientModel(
                                  pacientId: _pacientsController.generateId(),
                                  nome: _nameController.text,
                                  sobrenome: _sobrenomeController.text,
                                  aniversario: _birthdayController.text,
                                  cidade: _cityController.text,
                                  bairro: _bairroController.text,
                                  numero: _numberController.text,
                                  email: _emailController.text,
                                  celular: _cellphoneController.text,
                                  telefone: _telefoneController.text,
                                  firstSection: _firstSectionController.text,
                                ),
                                context,
                              )) {
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
