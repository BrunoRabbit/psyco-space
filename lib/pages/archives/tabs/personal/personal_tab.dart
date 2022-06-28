import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/pages/archives/tabs/personal/widgets/edit_pacient.dart';

import 'package:psyco_space/pages/archives/tabs/personal/widgets/personal_info.dart';
import 'package:psyco_space/pages/archives/tabs/personal/widgets/personal_title.dart';

class PersonalTab extends StatefulWidget {
  const PersonalTab({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalTab> createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PacientController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: Colors.black.withOpacity(0.65),
                    size: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    _controller.currentPacient!.nome ?? 'Inválido',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPacient(
                              pacientModel: _controller.currentPacient!),
                        ),
                      ).then(
                        (value) => _controller.setCurrentPacient(
                          _controller.listPacients.firstWhere((e) =>
                              e.pacientId ==
                              _controller.currentPacient!.pacientId),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit_rounded,
                      color: Colors.black.withOpacity(0.65),
                    ),
                  )
                ],
              ),
              Container(
                height: 1.5,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 30, top: 5, right: 30),
                color: Colors.black12,
              ),
              const PersonalTitle(
                leading: 'Informações pessoais',
                icon: Icons.assignment_ind_rounded,
              ),
              PersonalInfo(
                leading: 'Nome',
                title: _controller.currentPacient!.nome ?? 'Inválido',
              ),
              PersonalInfo(
                leading: 'Sobrenome',
                title: _controller.currentPacient!.sobrenome ?? 'Inválido',
              ),
              PersonalInfo(
                leading: 'Aniversário',
                title: _controller.currentPacient!.aniversario ??
                    'Não foi encontrado',
              ),
              const PersonalTitle(
                leading: 'Endereço',
                icon: Icons.home_rounded,
              ),
              PersonalInfo(
                leading: 'Cidade',
                title:
                    _controller.currentPacient!.cidade ?? 'Não foi encontrada',
              ),
              PersonalInfo(
                leading: 'Bairro',
                title:
                    _controller.currentPacient!.bairro ?? 'Não foi encontrado',
              ),
              PersonalInfo(
                leading: 'Número',
                title:
                    _controller.currentPacient!.numero ?? 'Não foi encontrado',
              ),
              const PersonalTitle(
                leading: 'Contato',
                icon: Icons.phone_rounded,
              ),
              PersonalInfo(
                leading: 'E-mail',
                title:
                    _controller.currentPacient!.email ?? 'Não foi encontrado',
              ),
              PersonalInfo(
                leading: 'Celular',
                title:
                    _controller.currentPacient!.celular ?? 'Não foi encontrado',
              ),
              PersonalInfo(
                leading: 'Telefone',
                title: _controller.currentPacient!.telefone ??
                    'Não foi encontrado',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
