import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/app_theme.dart';

class FlightInformationCard extends StatelessWidget {
  final String airline;
  final DateTime departureTime;
  final String airlineClass;
  final DateTime arrivalTime;
  final double price;
  final VoidCallback onTap;

  const FlightInformationCard({
    super.key,
    required this.onTap,
    required this.departureTime,
    required this.airlineClass,
    required this.arrivalTime,
    required this.price,
    required this.airline,
  });

  @override
  Widget build(BuildContext context) {
    final arrival = _formatDate(arrivalTime);
    final departure = _formatDate(departureTime);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(airline, style: AppTheme.cardTitleTextStyle),
              const SizedBox(height: 12),
              Text('$departure - $arrival',
                  style: AppTheme.cardContentTextStyle),
              const SizedBox(height: 12),
              Text('Clase: $airlineClass',
                  style: AppTheme.cardContentTextStyle),
              const SizedBox(height: 12),
              Text('Precio: \$${price.toStringAsFixed(2)}',
                  style: AppTheme.cardContentTextStyle),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return dateFormat.format(date);
  }
}
