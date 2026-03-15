import 'package:flutter/material.dart';

class BottomSheetVIP extends StatefulWidget {
  final double height;
  final String title;
  final List<String> options;
  final VoidCallback onClickConfirm;
  final VoidCallback onClickClose;
  BottomSheetVIP({
    Key? key,
    required this.height,
    required this.title,
    required this.onClickConfirm,
    required this.onClickClose,
    required this.options,
  }) : super(key: key);

  @override
  _BottomSheetVIPState createState() => _BottomSheetVIPState();
}

class _BottomSheetVIPState extends State<BottomSheetVIP> {
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: widget.options.map((e) => buildChip(context, e)).toList(),
          ),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: widget.onClickClose,
            child: Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
            ),
            onPressed: widget.onClickConfirm,
            child: Text('Confirm'),
          ),
        ],
      );

  Widget buildChip(BuildContext context, String e) {
    final isSelected = selectedOption == e;
    final foregroundColor = isSelected ? Colors.white : Colors.black;
    final backGrounColor = isSelected ? Colors.orange : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = e;
        });
      },
      child: Chip(
        shape: StadiumBorder(
            side: BorderSide(
          color: Colors.orange,
          width: 1.0,
        )),
        label: Text(
          e,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
        backgroundColor: backGrounColor,
      ),
    );
  }
}
