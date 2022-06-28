import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/models/mental_exam_model.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/pages/archives/tabs/anamnese/widgets/anamnese_title.dart';
import 'package:psyco_space/theme/app_colors.dart';

class MentalExamTab extends StatefulWidget {
  const MentalExamTab({Key? key}) : super(key: key);

  @override
  State<MentalExamTab> createState() => _MentalExamTabState();
}

class _MentalExamTabState extends State<MentalExamTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _alturaController;
  late TextEditingController _pesoController;
  late TextEditingController _vestuarioController;
  late TextEditingController _atitudeController;
  late TextEditingController _comportamentoController;
  late TextEditingController _discursoController;
  late TextEditingController _estadoEmocionalController;
  late TextEditingController _percepcaoController;
  late TextEditingController _pensamentoController;
  late TextEditingController _cognicaoController;
  late TextEditingController _conscienciaController;

  @override
  void initState() {
    _alturaController = TextEditingController(text: '1,75');
    _pesoController = TextEditingController(text: '66kg');
    _vestuarioController =
        TextEditingController(text: 'Bermuda e camisa verde');
    _atitudeController = TextEditingController(text: 'Evasivo');
    _comportamentoController =
        TextEditingController(text: 'Movimentação alterada');
    _discursoController = TextEditingController(text: 'Gaguejando');
    _estadoEmocionalController =
        TextEditingController(text: 'Felicidade e tristeza');
    _percepcaoController =
        TextEditingController(text: 'Sente tristeza em relacao ao mundo');
    _pensamentoController =
        TextEditingController(text: 'Forma, conteudos e curso');
    _cognicaoController = TextEditingController(text: 'Capacidade avançada');
    _conscienciaController = TextEditingController(text: 'Nivel elevado');
    super.initState();
  }

  @override
  void dispose() {
    _alturaController.dispose();
    _pesoController.dispose();
    _vestuarioController.dispose();
    _atitudeController.dispose();
    _comportamentoController.dispose();
    _discursoController.dispose();
    _estadoEmocionalController.dispose();
    _percepcaoController.dispose();
    _pensamentoController.dispose();
    _cognicaoController.dispose();
    _conscienciaController.dispose();
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
                  'Exame do estado mental (EEM)',
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
                  leading: 'Aparência',
                ),
                Text(
                  'Altura',
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
                  controller: _alturaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Altura não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Peso',
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
                  controller: _pesoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Peso não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vestuário',
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
                  controller: _vestuarioController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Vestuário não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Atitude Dominante',
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
                  controller: _atitudeController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Atitude não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const AnamneseTitle(
                  leading: 'Comportamento',
                ),
                Text(
                  'Movimentação e aspectos anormais',
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
                  controller: _comportamentoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Não pode ser vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Discurso',
                ),
                Text(
                  'Fluxo ao falar, hesitações, tiques',
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
                  controller: _discursoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Discurso não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Humor & afeto',
                ),
                Text(
                  'Expressões e estado emocional',
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
                  controller: _estadoEmocionalController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Estado emocional não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Percepção',
                ),
                Text(
                  'Como o paciente sente e interpreta o mundo',
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
                  controller: _percepcaoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Pensamento',
                ),
                Text(
                  'Forma, conteúdo e curso',
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
                  controller: _pensamentoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Pensamento não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const AnamneseTitle(
                  leading: 'Cognição',
                ),
                Text(
                  'Grau de pensamento*',
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
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Cognição não pode ser vazia';
                    }
                    return null;
                  },
                  controller: _cognicaoController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    '* Grau de pensamento abstrato, educação formal, inteligência, capacidade de concentração',
                    style: GoogleFonts.rubik(
                      fontSize: 15,
                      color: Colors.red.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const AnamneseTitle(
                  leading: 'Consciência',
                ),
                Text(
                  'Nível de consciência',
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
                  controller: _conscienciaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'tg_04',
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.save),
        onPressed: () async {
          if (await _controller.addPacientMentalExam(
            PacientModel(
              mentalExamModel: MentalExamModel(
                altura: _alturaController.text,
                atitudeDominante: _atitudeController.text,
                cognicao: _cognicaoController.text,
                comportamento: _comportamentoController.text,
                consciencia: _conscienciaController.text,
                discurso: _discursoController.text,
                estadoEmocional: _estadoEmocionalController.text,
                pensamento: _pensamentoController.text,
                percepcao: _percepcaoController.text,
                peso: _pesoController.text,
                vestuario: _vestuarioController.text,
              ),
            ),
            context,
          )) {}
        },
      ),
    );
  }
}
