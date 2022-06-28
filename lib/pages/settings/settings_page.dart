import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/pages/settings/widgets/address_body_widget.dart';
import 'package:psyco_space/pages/settings/widgets/card_widget.dart';
import 'package:psyco_space/pages/settings/widgets/email_body_widget.dart';
import 'package:psyco_space/pages/settings/widgets/full_name_body_widget.dart';
import 'package:psyco_space/pages/settings/widgets/password_body_widget.dart';
import 'package:psyco_space/theme/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _addressController;
  SettingsController _settingsController = SettingsController();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      _settingsController =
          Provider.of<SettingsController>(context, listen: false);
      _settingsController.getCurrentPsyco(context).then((_) => setState(() {
            _settingsController.psychoModel;
          }));
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Text(
          'Ajustes',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w700,
            color: const Color(0xfff6f6f6),
          ),
        ),
      ),
      body: Consumer<SettingsController>(
        builder: (context, value, child) {
          return Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Editar perfil',
                          style: GoogleFonts.rubik(
                            fontSize: 20,
                            color: Colors.black87.withOpacity(0.65),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CircleAvatar(
                    radius: 45,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    value.psychoModel.name ?? 'Usuário não encontrado',
                    style: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardWidget(
                    title: 'Nome completo',
                    onTap: () {
                      _openModalBottomSheet(
                        FullNameBodyWidget(
                          controller: _settingsController,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardWidget(
                    title: 'Senha',
                    onTap: () {
                      _openModalBottomSheet(
                        PasswordBodyWidget(
                          controller: _settingsController,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 45,
                    endIndent: 45,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardWidget(
                    title: 'E-mail',
                    onTap: () {
                      _openModalBottomSheet(
                        EmailBodyWidget(
                          controller: _settingsController,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardWidget(
                    title: 'Endereço',
                    onTap: () {
                      _openModalBottomSheet(
                        AddressBodyWidget(
                          controller: _settingsController,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _openModalBottomSheet(Widget body) {
    showModalBottomSheet(
      context: context,
      shape: const UnderlineInputBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          child: body,
        );
      },
    );
  }
}
