import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/pages/archives/tabs/anamnese/widgets/anamnese_title.dart';
import 'package:psyco_space/pages/history/widgets/card_history_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PacientController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico',
          style: GoogleFonts.rubik(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: AnamneseTitle(leading: 'Registros'),
              ),
              _controller.listHistory.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.23,
                      child: ListView.builder(
                        itemCount: _controller.listHistory.length,
                        itemBuilder: (context, index) {
                          return CardHistoryWidget(
                            pacientModel: _controller.listHistory[index],
                            index: index,
                          );
                        },
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Center(
                            child: Text(
                              'Lista vazia, adicione um registro',
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
