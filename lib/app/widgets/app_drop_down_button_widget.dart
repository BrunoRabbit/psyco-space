// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppDropDownButtonWidget extends StatefulWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  const AppDropDownButtonWidget({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _AppDropDownButtonWidgetState createState() =>
      _AppDropDownButtonWidgetState();
}

class _AppDropDownButtonWidgetState extends State<AppDropDownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.black.withOpacity(0.40),
        ),
      ),
      child: DropdownButton<String>(
          value: widget.value,
          isExpanded: true,
          isDense: true,
          underline: const SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          items: [
            ...widget.items.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                  ),
                ))
          ],
          onChanged: widget.onChanged),
    );
  }
}
