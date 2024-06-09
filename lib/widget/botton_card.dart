import 'package:calculater_provider/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottonCard extends StatelessWidget {
  String text;
  Color color;
  BottonCard({super.key, required this.text, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(text);
        Provider.of<CalculaterProvider>(context, listen: false).setValue(text);
      },
      child: Card(
        color: color,
        elevation: 25,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: Text(text),
        ),
      ),
    );
  }
}
