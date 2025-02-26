import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';
import '../widgets/terms_text.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(title: 'Terms of use'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TermsText(
                  'Cras nisi lectus, ultrices quis bibendum eu, viverra at mauris. Nulla nec arcu arcu. Morbi eu elementum libero. Sed sit amet elit ac odio laoreet aliquet. Quisque libero felis, tristique et fringilla sed, venenatis nec dolor. Quisque tempus nulla ac nisl vulputate, eget feugiat velit lacinia. Pellentesque a consectetur odio. Mauris cursus est odio, in pharetra urna aliquet at. Etiam et erat felis. Nunc a tempor dui. Mauris est neque, luctus gravida maximus ac, bibendum sed odio. Curabitur hendrerit nulla vitae ex mollis fringilla. Cras vestibulum feugiat sapien, sed tempus mauris sagittis nec. Mauris tincidunt imperdiet leo tempus vestibulum. Donec ac sapien magna. In non hendrerit eros.',
                ),
                SizedBox(height: 20),
                TermsText(
                  'Cras nisi lectus, ultrices quis bibendum eu, viverra at mauris. Nulla nec arcu arcu. Morbi eu elementum libero. Sed sit amet elit ac odio laoreet aliquet. Quisque libero felis, tristique et fringilla sed, venenatis nec dolor. Quisque tempus nulla ac nisl vulputate, eget feugiat velit lacinia. Pellentesque a consectetur odio. Mauris cursus est odio, in pharetra urna aliquet at. Etiam et erat felis. Nunc a tempor dui. Mauris est neque, luctus gravida maximus ac, bibendum sed odio. Curabitur hendrerit nulla vitae ex mollis fringilla. Cras vestibulum feugiat sapien, sed tempus mauris sagittis nec. Mauris tincidunt imperdiet leo tempus vestibulum. Donec ac sapien magna. In non hendrerit eros.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
