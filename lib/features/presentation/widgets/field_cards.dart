import 'package:flutter/material.dart';
import 'package:smart_season_system/core/utils/screensize.dart';
import '../../data/models/models.dart';

import 'package:flutter/material.dart';
import '../../data/models/models.dart';


class FieldCards extends StatelessWidget {
  final DashboardCardModel card;

  const FieldCards({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = ScreenSize.width(context);
      final bool isMobile = w < 1000;

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: card.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: isMobile
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(card.icon, color: card.color, size: 26),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                  Text(
                    card.value.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(card.icon, color: card.color, size: 30),
            const SizedBox(height: 10),
            Text(card.title, style: const TextStyle(fontSize: 14)),
            Text(
              card.value.toString(),
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    });
  }
}