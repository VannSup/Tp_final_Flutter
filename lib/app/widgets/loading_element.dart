import 'package:flutter/material.dart';

class LoadingElement extends StatelessWidget {
  const LoadingElement({this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularProgressIndicator(
            color: Colors.black,
          ),
          Text(
            'CRÉATION D\'UNE NOUVELLE NOTE EN COURS',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
