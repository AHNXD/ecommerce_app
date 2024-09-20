import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    List s = ['S', 'M', 'L', 'XL', 'XXL'];
    List ss = [39, 40, 41, 42, 44];
    if (category == 'ملابس') {
      return Row(
        children: [
          const Text(
            'sizes:',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            s.join(' , '),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      );
    } else if (category == 'أحذية') {
      return Row(
        children: [
          const Text(
            'sizes:',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            ss.join(' , '),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      );
    }
    return const SizedBox();
  }
}
