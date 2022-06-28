import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/pages/archives/tabs/anamnese/anamnese_tab.dart';
import 'package:psyco_space/pages/archives/tabs/mental_exam/mental_exam_tab.dart';
import 'package:psyco_space/pages/archives/tabs/personal/personal_tab.dart';
import 'package:psyco_space/pages/archives/tabs/registers/registers_tab.dart';
import 'package:psyco_space/routes.dart';

import '../../theme/app_colors.dart';

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({Key? key}) : super(key: key);

  @override
  _ArchivesPageState createState() => _ArchivesPageState();
}

class _ArchivesPageState extends State<ArchivesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFEFD),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.primary,
          title: Text(
            'PsycoSpace',
            style: GoogleFonts.rubik(
              color: const Color(0xffFFFEFD),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppPlaces.kHistoryPage);
                },
                child: const Icon(
                  Icons.history,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.primary,
              labelColor: const Color(0xff1b1c1e),
              unselectedLabelStyle: GoogleFonts.rubik(
                fontSize: 15,
                color: const Color(0xff1b1c1e).withOpacity(0.6),
              ),
              labelStyle: GoogleFonts.rubik(
                color: const Color(0xff1b1c1e),
              ),
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  icon: Text(
                    'Pessoal',
                  ),
                ),
                Tab(
                  icon: Text(
                    'Anamnese',
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Tab(
                    icon: Text(
                      'Exame mental',
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.none,
                  child: Tab(
                    icon: Text('Registros'),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                // controller: _tabController,
                children: [
                  // My screens
                  PersonalTab(),
                  AnamneseTab(),
                  MentalExamTab(),
                  RegistersTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
