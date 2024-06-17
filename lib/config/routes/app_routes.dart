import 'package:flights_app/layers/presentation/screens/home/home_screen.dart';
import 'package:flights_app/layers/presentation/screens/home/reservations/flight_reservations_screen.dart';
import 'package:go_router/go_router.dart';

import '../../layers/presentation/screens/login.dart';

class AppRoutes {
  AppRoutes();

  //Route naems
  // Principal route names
  static const String loginPage = 'login';
  static const String registerPage = 'register';

  //Route names -> After login or register
  static const String homePage = 'home';
  // Reserve service route names
  static const String reservePage = 'reserveServices';

  //User -> user views
  static const String userPage = 'user';
  static const String userReserves = 'user_reservers';
  static const String userFlights = 'user_flights';
  static const String userHotels = 'user_hotels';

  //Paths
  // Principal route paths
  static const String _loginPageRoute = '/login';
  static const String _registerPageRoute = '/register';

  //Route paths -> After login or register. login/register -> home
  static const String _homePageRoute = '/home';
  // Reserve service route paths
  static const String _reservesPageRoute = 'reserveFlight';

  //User -> user views paths
  static const String _userPageRoute = '/user';
  static const String _userReservesRoute = '/user_reservers';
  // From user reserves. user -> reserves -> specific reserves
  static const String _userFlightsRoute = '/user_flights';
  static const String _userHotelsRoute = '/user_hotels';

  final appRoutes = GoRouter(initialLocation: _loginPageRoute, routes: [
    GoRoute(
      name: loginPage,
      path: _loginPageRoute,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: registerPage,
      path: _registerPageRoute,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
        name: homePage,
        path: _homePageRoute,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: reservePage,
            path: _reservesPageRoute,
            builder: (context, state) => const FlightReservationsScreen(),
          ),
        ]),
  ]);
}
