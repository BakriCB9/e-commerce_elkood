import 'package:flutter/material.dart';

class SectionInvoice extends StatelessWidget {
  final double subTotal;
  const SectionInvoice({required this.subTotal, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Sub total"), Text("$subTotal \$")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Delievry Free"), Text("10 \$")],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total"),
            Text("${(subTotal + 10.0).toStringAsFixed(3)} \$"),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Cehckout")],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
