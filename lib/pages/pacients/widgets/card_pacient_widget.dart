import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/routes.dart';

class CardPacientWidget extends StatelessWidget {
  final PacientModel item;

  const CardPacientWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PacientController>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: InkWell(
            onTap: () {
              _controller.setCurrentPacient(
                _controller.listPacients.firstWhere(
                  (e) => e.pacientId == item.pacientId,
                ),
              );
              Navigator.of(context).pushNamed(
                AppPlaces.kArchivePage,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          '${item.nome!} ${item.sobrenome!}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          'Primeira sessão: ${item.firstSection}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_right_rounded,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
