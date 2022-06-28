import 'package:flutter/material.dart';

class AppHubWidget extends StatelessWidget {
  final bool inAsyncCall;
  final Widget appWidget;
  final Key scaffoldKey;
  const AppHubWidget({
    Key? key,
    required this.inAsyncCall,
    required this.appWidget,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          appWidget,
          Visibility(
            visible: inAsyncCall,
            child: buildAsyncFeedback(),
          ),
        ],
      ),
    );
  }

  Widget buildAsyncFeedback() {
    return Container(
      color: Colors.black26,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
