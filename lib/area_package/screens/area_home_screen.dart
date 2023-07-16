// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:area/area.dart' as area;

class AreaHomeScreen extends StatefulWidget {
  const AreaHomeScreen({super.key});

  @override
  State<AreaHomeScreen> createState() => _AreaHomeScreenState();
}

class _AreaHomeScreenState extends State<AreaHomeScreen> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  String rectResult = '0';
  String triangleResult = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          resultCard(
            label: 'rectangle area ',
            value: rectResult,
          ),
          resultCard(
            label: 'triangle area ',
            value: triangleResult,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customTextField(
                lengthController,
                label: 'length',
              ),
              customTextField(
                widthController,
                label: 'width',
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              final width = double.tryParse(widthController.value.text);
              final height = double.tryParse(lengthController.value.text);
              if (width == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'invalid width',
                    ),
                  ),
                );
              } else if (height == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'invalid length',
                    ),
                  ),
                );
              } else {
                final rectArea = area.calculateAreaRect(width, height);
                final triangleArea = area.calculateAreaTriangle(width, height);
                setState(() {
                  rectResult = rectArea;
                  triangleResult = triangleArea;
                });
              }
            },
            child: const Text(
              'calculate',
            ),
          ),
        ],
      ),
    );
  }

  Card resultCard({
    required String label,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Text('$label : $value'),
    );
  }

  Container customTextField(
    TextEditingController controller, {
    required String label,
  }) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: borderDecoration(color: Colors.grey, width: 1),
          focusedBorder: borderDecoration(color: Colors.green, width: 1.5),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration({
    required Color color,
    required double width,
  }) =>
      OutlineInputBorder(borderSide: BorderSide(color: color, width: width));
}
