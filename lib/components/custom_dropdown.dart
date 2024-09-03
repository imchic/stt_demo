import 'package:flutter/material.dart';

import '../utils/applog.dart';

class CustomDropDownWidget extends StatefulWidget {

  String title;
  List<String> items;
  Function(int) onSelected;
  int selectedIndex;

  CustomDropDownWidget({super.key, required this.title, required this.items, required this.onSelected, this.selectedIndex = 0});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {

  final LayerLink _layerLink = LayerLink();



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            AppLog.d('show dropdown');
            // expand dropdown
            setState(() {
              widget.onSelected(widget.selectedIndex);
              _showDropDown(context);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.items[widget.selectedIndex]),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _showDropDown(BuildContext context) {

  }

}
