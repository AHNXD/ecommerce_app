import 'package:flutter/material.dart';
import '../../../Utils/colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.category});
  final String category;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Sizes for clothes
    List<String> clothSizes = ['S', 'M', 'L', 'XL', 'XXL'];
    // Sizes for shoes
    List<int> shoeSizes = [39, 40, 41, 42, 44];

    List<dynamic> sizes = widget.category == 'ملابس' ? clothSizes : shoeSizes;

    if (widget.category == 'ملابس' || widget.category == 'أحذية') {
      return Row(
        children: [
          const Text(
            'Sizes: ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: selectedIndex == index
                            ? AppColors.primaryColors
                            : Colors.grey.shade200,
                        child: Text(
                          sizes[index].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}
