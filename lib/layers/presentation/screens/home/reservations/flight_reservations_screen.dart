import 'package:flights_app/config/theme/app_theme.dart';
import 'package:flights_app/layers/presentation/widgets/custom/cards/flight_information_card.dart';
import 'package:flutter/material.dart';

class FlightReservationsScreen extends StatefulWidget {
  const FlightReservationsScreen({super.key});

  @override
  State<FlightReservationsScreen> createState() =>
      _FlightReservationsScreenState();
}

class _FlightReservationsScreenState extends State<FlightReservationsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelos', style: AppTheme.titleTextStyle),
      ),
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: FlightInformationCard(
                    airline: 'Aerolínea 1',
                    departureTime: DateTime.now(),
                    airlineClass: 'Clase 1',
                    arrivalTime: DateTime.now(),
                    price: 100.0,
                    onTap: () {},
                  ),
                );
              }),
        ),
      ),
    );
  }
}
