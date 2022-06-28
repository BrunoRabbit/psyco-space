import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/pages/archives/tabs/personal/widgets/personal_info.dart';

class CardHistoryWidget extends StatefulWidget {
  final PacientModel pacientModel;
  final int index;

  const CardHistoryWidget({
    Key? key,
    required this.pacientModel,
    required this.index,
  }) : super(key: key);

  @override
  State<CardHistoryWidget> createState() => _CardHistoryWidgetState();
}

class _CardHistoryWidgetState extends State<CardHistoryWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
                top: 5,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Sessão ${widget.index + 1}',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                      Text(
                        'Ultima sessão: ${widget.pacientModel.registerModel!.dateTime!}',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.55),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        !isOpen ? Icons.arrow_right : Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          isOpen
              ? Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    child: SizedBox(
                      height: 380,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              PersonalInfo(
                                leading: 'Tópicos a serem abordados',
                                title:
                                    '${widget.pacientModel.registerModel!.agenda}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'Início da sessão',
                                title:
                                    '${widget.pacientModel.registerModel!.startTime}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'Término da sessão',
                                title:
                                    '${widget.pacientModel.registerModel!.finishTime}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'Humor do paciente',
                                title:
                                    '${widget.pacientModel.registerModel!.humor}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'Atividades realizadas',
                                title:
                                    '${widget.pacientModel.registerModel!.atividadeRealizada}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'Resumo',
                                title:
                                    '${widget.pacientModel.registerModel!.resumo}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading: 'FeedBack do paciente',
                                title:
                                    '${widget.pacientModel.registerModel!.feedBack}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                              PersonalInfo(
                                leading:
                                    'Razao de encerramento ou encaminhamento',
                                title:
                                    '${widget.pacientModel.registerModel!.encerramentoEncaminhamento}',
                                leadingSize: 14,
                                titleSize: 14,
                                overflowLeading: TextOverflow.clip,
                                overflowTitle: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
