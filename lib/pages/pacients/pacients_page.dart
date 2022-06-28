import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_text_field_widget.dart';
import 'package:psyco_space/controllers/app_authentication_controller.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/pages/pacients/widgets/add_pacient.dart';
import 'package:psyco_space/pages/pacients/widgets/card_pacient_widget.dart';
import 'package:psyco_space/routes.dart';
import 'package:psyco_space/theme/app_colors.dart';

class PacientsPage extends StatefulWidget {
  const PacientsPage({Key? key}) : super(key: key);

  @override
  _PacientsPageState createState() => _PacientsPageState();
}

class _PacientsPageState extends State<PacientsPage> {
  @override
  Widget build(BuildContext context) {
    final _pacientsController = Provider.of<PacientController>(context);
    final _authController = Provider.of<AppAuthenticationController>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () async {
                await _authController.signOut(context);
                // _pacientsController.clearList();
                Navigator.of(context)
                    .pushReplacementNamed(AppPlaces.kWelcomePage);
              },
              child: const Icon(
                Icons.logout_outlined,
                size: 28,
              ),
            ),
          ),
        ],
        title: Text(
          'Pacientes',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w600,
            color: const Color(0xfff6f6f6),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AppTextFieldWidget(
                  hintText: 'Pesquise o paciente',
                  controller: _pacientsController.searchControl,
                  onChanged: (name) async {
                    // depois de 1.0 sec fazer a requisicao
                    await Future.delayed(
                      const Duration(milliseconds: 1000),
                      () {
                        _pacientsController.searchForm(name);
                      },
                    );
                  },
                ),
              ),
              _pacientsController.listPacients.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                      itemCount: _pacientsController.actualList.length,
                      itemBuilder: (context, index) {
                        return CardPacientWidget(
                          item: _pacientsController.actualList[index],
                        );
                      },
                    ))
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search_off_rounded,
                              size: 42,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Não foi encontrado nenhum paciente!',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Você pode adicionar um paciente no canto inferior direito.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 16,
                              ),
                            ),
                            // const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
            ],
          ),

          //
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'tg_1',
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPacient(),
            ),
          );
        },
      ),
    );
  }
}
