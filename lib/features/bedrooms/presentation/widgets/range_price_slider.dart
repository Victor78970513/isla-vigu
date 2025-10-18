import 'package:flutter/material.dart';

class RangePriceSlider extends StatelessWidget {
  const RangePriceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Slider(
            value: 0.5,
            activeColor: Color(0xff0075FF),
            inactiveColor: Color(0xff369AE4),
            onChanged: (value) {},
          ),
        ),
        Row(
          children: [
            Text(
              "\$20",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Text(
              "\$120",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
