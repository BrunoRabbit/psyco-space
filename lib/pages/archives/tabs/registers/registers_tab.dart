import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/models/register_model.dart';
import 'package:psyco_space/pages/archives/tabs/anamnese/widgets/anamnese_title.dart';
import 'package:psyco_space/theme/app_colors.dart';

class RegistersTab extends StatefulWidget {
  const RegistersTab({Key? key}) : super(key: key);

  @override
  State<RegistersTab> createState() => _RegistersTabState();
}

class _RegistersTabState extends State<RegistersTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _agendaController;
  late TextEditingController _startTimeController;
  late TextEditingController _finishTimeController;
  late TextEditingController _humorController;
  late TextEditingController _atividadeRealizadaController;
  late TextEditingController _resumoController;
  late TextEditingController _feedBackController;
  late TextEditingController _encerramentoController;

  @override
  void initState() {
    _agendaController =
        TextEditingController(text: 'Alguns topicos abordados pelo psicologo');
    _startTimeController = TextEditingController(text: '14:30 pm');
    _finishTimeController = TextEditingController(text: '18:35 pm');
    _humorController = TextEditingController(text: 'Apreensivo');
    _atividadeRealizadaController =
        TextEditingController(text: 'Fez um sistema incrível');
    _resumoController = TextEditingController(text: 'Fez com total sabedoria');
    _feedBackController = TextEditingController(
        text: 'Gostou bastante do psicologo e achou facil o sistema');
    _encerramentoController = TextEditingController(
        text: 'Foi encerramento foi do termino do projeto');
    super.initState();
  }

  @override
  void dispose() {
    _agendaController.dispose();
    _startTimeController.dispose();
    _finishTimeController.dispose();
    _humorController.dispose();
    _atividadeRealizadaController.dispose();
    _resumoController.dispose();
    _feedBackController.dispose();
    _encerramentoController.dispose();
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
                  'Registro de sessão',
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
                  leading: 'Agenda',
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Tópicos a serem abordados',
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
                  controller: _agendaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Topicos não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const AnamneseTitle(
                  leading: 'Data & Hora',
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
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            _controller.dateFormat
                                .format(
                                  _controller.selectedDate.toLocal(),
                                )
                                .replaceAll(' ', '/'),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 45,
                        color: Colors.grey[300],
                        child: IconButton(
                          onPressed: () {
                            _controller.openDatePicker(context);
                          },
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Início',
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
                  controller: _startTimeController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Início não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Término',
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
                  controller: _finishTimeController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Fim não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const AnamneseTitle(
                  leading: 'Avaliação',
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Humor',
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
                  controller: _humorController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Humor não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Registro de atividades realizadas',
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
                  controller: _atividadeRealizadaController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Atividades não podem ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Resumo',
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
                  controller: _resumoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Resumo não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Feedback do paciente',
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
                  controller: _feedBackController,
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
                Text(
                  'Razão de encerramento ou encaminhamento',
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
                  controller: _encerramentoController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Preencha esse campo';
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
        heroTag: 'tg_04',
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.save),
        onPressed: () async {
          if (await _controller.addPacientRegister(
            PacientModel(
              registerModel: RegisterModel(
                agenda: _agendaController.text,
                atividadeRealizada: _atividadeRealizadaController.text,
                dateTime: _controller.dateFormat
                    .format(_controller.selectedDate.toLocal())
                    .replaceAll(' ', '/'),
                encerramentoEncaminhamento: _encerramentoController.text,
                feedBack: _feedBackController.text,
                finishTime: _finishTimeController.text,
                humor: _humorController.text,
                resumo: _resumoController.text,
                startTime: _startTimeController.text,
              ),
            ),
            context,
          )) {}
        },
      ),
    );
  }
}
