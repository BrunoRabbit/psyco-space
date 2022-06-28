import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/models/anamnese_model.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/pages/archives/tabs/anamnese/widgets/anamnese_title.dart';
import 'package:psyco_space/theme/app_colors.dart';

class AnamneseTab extends StatefulWidget {
  const AnamneseTab({Key? key}) : super(key: key);

  @override
  State<AnamneseTab> createState() => _AnamneseTabState();
}

class _AnamneseTabState extends State<AnamneseTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _queixaPrincipalController;
  late TextEditingController _descricaoController;
  late TextEditingController _sinteseController;
  late TextEditingController _sintomasController;
  late TextEditingController _quandoSurgiuController;
  late TextEditingController _agravantesController;
  late TextEditingController _circunstanciaController;
  late TextEditingController _tabagismoController;
  late TextEditingController _alcoolismoController;
  late TextEditingController _sedentarismoController;
  late TextEditingController _sintomasParecidosController;
  late TextEditingController _familiaresDoencaController;

  @override
  void initState() {
    _queixaPrincipalController = TextEditingController(text: 'Sujeira no pé');
    _descricaoController =
        TextEditingController(text: 'Breve resumo do quadro do paciente');
    _sinteseController =
        TextEditingController(text: 'Detalhamento do quadro atual do paciente');
    _sintomasController = TextEditingController(text: 'Fortes coceiras');
    _quandoSurgiuController = TextEditingController(text: '14/06/2005');
    _agravantesController =
        TextEditingController(text: 'Fatores que aumentem o quadro');
    _circunstanciaController =
        TextEditingController(text: 'Sobre quais circunstancias');
    _tabagismoController = TextEditingController(text: 'Sim');
    _alcoolismoController = TextEditingController(text: 'Não');
    _sedentarismoController = TextEditingController(text: 'Sim');
    _sintomasParecidosController =
        TextEditingController(text: 'Sim com confirmação');
    _familiaresDoencaController =
        TextEditingController(text: 'Não sem confirmacao');
    super.initState();
  }

  @override
  void dispose() {
    _queixaPrincipalController.dispose();
    _descricaoController.dispose();
    _sinteseController.dispose();
    _sintomasController.dispose();
    _quandoSurgiuController.dispose();
    _agravantesController.dispose();
    _circunstanciaController.dispose();
    _tabagismoController.dispose();
    _alcoolismoController.dispose();
    _sedentarismoController.dispose();
    _sintomasParecidosController.dispose();
    _familiaresDoencaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PacientController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anamnese',
                  style: GoogleFonts.rubik(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                Container(
                  height: 1.5,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 30, top: 5, right: 30),
                  color: Colors.black12,
                ),
                const AnamneseTitle(
                  leading: 'Queixa principal (QP)',
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _queixaPrincipalController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Queixa principal não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Histórico de doença atual (HDA)',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Descrição',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _descricaoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Descrição não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Síntese',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _sinteseController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Síntese não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sintomas',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _sintomasController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Sintomas não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Quando surgiu',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _quandoSurgiuController,
                  textInputFormatters: [
                    DataInputFormatter(),
                  ],
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'A data não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Fatores agravantes ou atenuantes',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _agravantesController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Os fatores agravantes não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Circunstância',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _circunstanciaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Circunstância não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Hábitos de vida',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tabagismo',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _tabagismoController,
                  textInputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Tabagismo não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Alcoolismo',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _alcoolismoController,
                  textInputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Alcoolismo não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sedentarismo',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: '',
                  controller: _sedentarismoController,
                  textInputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Sedentarismo não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Histórico familiar',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Familiares com sintomas parecidos',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: 'Familiares com sintomas parecidos',
                  controller: _sintomasParecidosController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Sintomas não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Familiares com alguma doença ou transtorno mental',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextFieldWidget(
                  hintText: 'Familiares com alguma doença ou transtorno mental',
                  controller: _familiaresDoencaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Doenças não podem ser vazias';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'tg_03',
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.save),
        onPressed: () async {
          if (await _controller.addPacientAnamnese(
            PacientModel(
              anamneseModel: AnamneseModel(
                queixaPrincipal: _queixaPrincipalController.text,
                descricao: _descricaoController.text,
                sintese: _sinteseController.text,
                sintomas: _sintomasController.text,
                quandoSurgiu: _quandoSurgiuController.text,
                fatoresAgravantes: _agravantesController.text,
                circunstancia: _circunstanciaController.text,
                tabagismo: _tabagismoController.text,
                alcoolismo: _alcoolismoController.text,
                sedentarismo: _sedentarismoController.text,
                sintomasParecidos: _sintomasParecidosController.text,
                familiaresDoenca: _familiaresDoencaController.text,
              ),
            ),
            context,
          )) {}
        },
      ),
    );
  }
}
