import 'package:flutter/material.dart';
import 'package:smart_season_system/core/utils/color.dart';
import 'package:smart_season_system/core/utils/screensize.dart';
import '../../../core/utils/get_colors.dart';
import '../../data/models/models.dart';
import '../model.dart';

class FieldCards extends StatelessWidget {
  final DashboardCardModel card;

  const FieldCards({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // We use a Row if the card is wide enough, otherwise a Column
        final bool useVertical = constraints.maxWidth < 160;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: card.color.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Accent bar at the top or side
                Positioned(
                  top: 0,
                  left: 0,
                  right: useVertical ? 0 : null,
                  bottom: useVertical ? null : 0,
                  child: Container(
                    width: useVertical ? double.infinity : 4,
                    height: useVertical ? 4 : double.infinity,
                    color: card.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: useVertical
                      ? _buildVerticalLayout(card)
                      : _buildHorizontalLayout(card),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVerticalLayout(DashboardCardModel card) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(card.icon, size: 24, color: card.color),
        const SizedBox(height: 8),
        Text(
          card.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        Text(
          card.value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout(DashboardCardModel card) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: card.color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(card.icon, size: 28, color: card.color),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.title,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              Text(
                card.value.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}