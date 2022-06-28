import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/pages/sign_up/pages/address_step_page.dart';
import 'package:psyco_space/pages/sign_up/pages/email_step_page.dart';
import 'package:psyco_space/pages/sign_up/pages/personal_step_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<FormController>(context);
    return SafeArea(
      child: Scaffold(
        body: Consumer<FormController>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(
                      0.1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_controller.index != 0) {
                        setState(() {
                          value.index--;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: value.index,
                    children: const [
                      PersonalStepPage(),
                      EmailStepPage(),
                      AddressStepPage(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
