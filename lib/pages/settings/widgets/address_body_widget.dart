import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/utils/mock_data.dart';
import 'package:psyco_space/app/widgets/app_drop_down_button_widget.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/controllers/settings_controller.dart';

import 'package:psyco_space/models/address_model.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class AddressBodyWidget extends StatefulWidget {
  final SettingsController controller;

  const AddressBodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AddressBodyWidget> createState() => _AddressBodyWidgetState();
}

class _AddressBodyWidgetState extends State<AddressBodyWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _cepController;
  late TextEditingController _cityController;
  late TextEditingController _districtController;
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  @override
  void initState() {
    _cepController = TextEditingController();
    _cityController = TextEditingController();
    _districtController = TextEditingController();
    _streetController = TextEditingController();
    _numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cepController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<FormController>(
        builder: (context, value, child) {
          return Form(
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
                    controller: _cepController,
                    onChanged: (value) {
                      if (value.length == 10) {
                        FocusManager.instance.primaryFocus!.unfocus();
                        UtilBrasilFields.removeCaracteres(
                          _cepController.text,
                        );
                      }
                    },
                    textInputType: TextInputType.number,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    hintText: widget.controller.psychoModel.addressModel!.cep ??
                        'CEP não encontrado',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'CEP nao pode ser vazio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppDropDownButtonWidget(
                    value: value.actualStateUF,
                    items: MockData.states,
                    onChanged: (state) {
                      setState(() => value.actualStateUF = state!);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextFieldWidget(
                    controller: _cityController,
                    hintText:
                        widget.controller.psychoModel.addressModel!.city ??
                            'Cidade não foi encontrado',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Cidade não pode ser vazia';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextFieldWidget(
                    controller: _districtController,
                    hintText:
                        widget.controller.psychoModel.addressModel!.district ??
                            'Bairro não foi encontrado',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Bairro não pode ser vazio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextFieldWidget(
                    controller: _streetController,
                    hintText:
                        widget.controller.psychoModel.addressModel!.street ??
                            'A rua não foi encontrada',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Rua não pode ser vazia';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextFieldWidget(
                    controller: _numberController,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    hintText:
                        widget.controller.psychoModel.addressModel!.number ??
                            'Numero não foi encontrado',
                    textInputType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Número nao pode ser vazio';
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
                      AddressModel adress = AddressModel(
                        cep: _cepController.text,
                        city: _cityController.text,
                        district: _districtController.text,
                        street: _streetController.text,
                        number: _numberController.text,
                        stateUF: value.actualStateUF,
                        country: 'Brasil',
                      );
                      if (_formKey.currentState!.validate()) {
                        if (await widget.controller.changePsychologyst(
                            PsychologistModel(addressModel: adress), context)) {
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
          );
        },
      ),
    );
  }
}
