import 'package:flutter/material.dart';


class RatingInfo extends StatelessWidget {
  const RatingInfo({Key? key, required this.rate}) : super(key: key);

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$rate',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                  ),
            ),
            const SizedBox(width: 5),
            Text(
              'rating',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < rate ? const Color(0xffFF981F) : Colors.black,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
