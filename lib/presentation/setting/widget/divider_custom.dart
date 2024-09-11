import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Divider(
            height: 1,
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 9,
          child: Divider(
            height: 1,
            color: Color(0xFFDBDBDD),
          ),
        ),
      ],
    );
  }
}
