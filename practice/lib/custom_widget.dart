import 'package:flutter/material.dart';

class icon_button extends StatelessWidget {
  final Color bdColor;

  const icon_button({
    super.key,
    required this.bdColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: bdColor,
          width: 2.0,
        ),
      ),
    );
  }
}

class Border_text extends StatelessWidget {
  final String text;
  final Color bdColor;
  final Color txtColor;
  final double fontsize;
  final double bdheight;
  final double pdsize;

  const Border_text({
    super.key,
    required this.text,
    required this.bdColor,
    required this.txtColor,
    required this.fontsize,
    required this.bdheight,
    required this.pdsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: bdheight,
      decoration: BoxDecoration(
        border: Border.all(
          color: bdColor,
          width: 2.2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pdsize),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
