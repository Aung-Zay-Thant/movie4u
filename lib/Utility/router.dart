import 'package:get/route_manager.dart';
import 'package:movie_suggestions_4_u/Screens/main_screen.dart';

class Routers {
  static final route = [
    GetPage(
      name: '/mainScreen',
      page: () => MainScreen()
      ),
      ];
}
