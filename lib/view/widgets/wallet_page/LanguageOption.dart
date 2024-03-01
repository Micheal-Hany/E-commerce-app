import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LanguageOption extends StatelessWidget {
  final String imageUrl;
  final String language;
  final bool selected;
  final VoidCallback onTap;

  const LanguageOption({
    Key? key,
    required this.imageUrl,
    required this.language,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 100,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 50,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              language,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge, // Adjust the style as needed
            ),
            if (selected)
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: 40, // Adjust width as needed
                height: 3,
                color: Colors.blue, // Adjust color as needed
              ),
          ],
        ),
      ),
    );
  }
}
