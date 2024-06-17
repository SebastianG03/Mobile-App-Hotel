import 'package:flights_app/config/routes/app_routes.dart';
import 'package:flights_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Flight App',
                  style: AppTheme.titleTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  'Discover the best flight and hotel deals for your next trip!',
                  style: AppTheme.normalTextStyle,
                ),
                const SizedBox(height: 20),
                CardModel(
                  cardTitle: 'Realiza tus reservas con tu aerolínea favorita',
                  cardContent:
                      'Reserva tus vuelos de la manera más rápida, económica y sencilla posible.',
                  imageUrl:
                      'https://www.travelandleisure.com/thmb/UT3s427mWGUk9OCnc7jltBrCbsU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/TAL-airpplane-taking-off-FLIGHTDEALS0923-7b2f9808fd324bf09423c29e44c1f96a.jpg',
                  onPressed: () => context.pushNamed(AppRoutes.reservePage),
                ),
                const SizedBox(height: 20),
                CardModel(
                  cardTitle: 'Reserva en los mejores hoteles del mundo',
                  cardContent:
                      'Date un gusto y reserva una estadía confortable en los hoteles recomendades por los turistas.',
                  imageUrl:
                      'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=2119&height=1195&fit=crop&format=pjpg&auto=webp',
                  onPressed: () {},
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardModel extends StatelessWidget {
  final String cardTitle;
  final String cardContent;
  final String imageUrl;
  final VoidCallback onPressed;

  const CardModel(
      {super.key,
      required this.cardTitle,
      required this.cardContent,
      this.imageUrl = '',
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Text(cardTitle, style: AppTheme.cardTitleTextStyle),
            const SizedBox(height: 12),
            Text(cardContent, style: AppTheme.cardContentTextStyle),
            const SizedBox(height: 12),
            if (imageUrl.isNotEmpty)
              Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fitWidth,
                        height: 150,
                      ),
                    ),
                    IconButton.filled(
                        onPressed: () => onPressed(),
                        icon: const Icon(Icons.arrow_forward_ios_rounded)),
                  ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
