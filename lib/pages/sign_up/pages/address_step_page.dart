import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/utils/mock_data.dart';
import 'package:psyco_space/app/widgets/app_drop_down_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/controllers/sign_up_controller.dart';
import 'package:psyco_space/models/address_model.dart';
import 'package:psyco_space/routes.dart';

import '../../../app/widgets/app_elevated_button_widget.dart';

class AddressStepPage extends StatefulWidget {
  const AddressStepPage({Key? key}) : super(key: key);

  @override
  _AddressStepPageState createState() => _AddressStepPageState();
}

class _AddressStepPageState extends State<AddressStepPage> {
  late final TextEditingController _cepEditingController;
  late final TextEditingController _cityEditingController;
  late final TextEditingController _streetEditingController;
  late final TextEditingController _districtEditingController;
  late final TextEditingController _numberEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cepEditingController = TextEditingController(text: '55.555-555');
    _cityEditingController = TextEditingController(text: 'Guaratingueta');
    _streetEditingController =
        TextEditingController(text: 'Rua Vila dos Santos');
    _districtEditingController = TextEditingController(text: 'Santa Luzia');
    _numberEditingController = TextEditingController(text: '123');
    super.initState();
  }

  @override
  void dispose() {
    _cepEditingController.dispose();
    _cityEditingController.dispose();
    _streetEditingController.dispose();
    _districtEditingController.dispose();
    _numberEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<SignUpController>(context, listen: true);
    final _controllerForm = Provider.of<FormController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Text(
                  'Bom, agora insira seu endereço atual',
                  style: GoogleFonts.rubik(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(
                      0.7,
                    ),
                  ),
                ),
              ),
              const AppTextFieldWidget(
                isActive: false,
                hintText: 'Brasil',
              ),
              const SizedBox(
                height: 12,
              ),
              AppTextFieldWidget(
                controller: _cepEditingController,
                onChanged: (value) {
                  if (value.length == 10) {
                    FocusManager.instance.primaryFocus!.unfocus();
                    UtilBrasilFields.removeCaracteres(
                      _cepEditingController.text,
                    );
                  }
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'CEP nao pode ser vazio';
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                textInputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                hintText: 'CEP',
              ),
              const SizedBox(
                height: 12,
              ),
              AppDropDownButtonWidget(
                value: _controllerForm.actualStateUF,
                items: MockData.states,
                onChanged: (state) {
                  setState(() => _controllerForm.actualStateUF = state!);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppTextFieldWidget(
                controller: _cityEditingController,
                hintText: 'Cidade',
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Cidade não pode ser vazia';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppTextFieldWidget(
                controller: _districtEditingController,
                hintText: 'Bairro',
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Bairro não pode ser vazio';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppTextFieldWidget(
                controller: _streetEditingController,
                hintText: 'Rua',
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Rua não pode ser vazia';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppTextFieldWidget(
                controller: _numberEditingController,
                textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
                hintText: 'Número',
                textInputType: TextInputType.number,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Número nao pode ser vazio';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppElevatedButtonWidget(
                  size: 100,
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_formKey.currentState!.validate()) {
                      await _controller.setAdressStep(
                        AddressModel(
                          cep: _cepEditingController.text,
                          country: 'Brasil',
                          stateUF: _controllerForm.actualStateUF,
                          district: _districtEditingController.text,
                          number: _numberEditingController.text,
                          street: _streetEditingController.text,
                          city: _cityEditingController.text,
                        ),
                      );

                      if (await _controller.createPsychoInDatabase(context)) {
                        Navigator.pushNamed(context, AppPlaces.kRootPage);
                        setState(() {
                          _controllerForm.index = 0;
                        });
                      }
                    }
                  },
                  label: 'Próximo',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
