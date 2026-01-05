import 'package:go_router/go_router.dart';
import 'package:netsanet/features/home/presentation/screen/client_home_screen.dart';
import 'package:netsanet/features/home/presentation/screen/provider_home_screen.dart';
import 'package:netsanet/features/welcome/welcome_screen.dart';
import 'route_names.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/create_account_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteName.welcome,
    routes: [
      GoRoute(
        path: RouteName.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.createAccount,
        builder: (context, state) => const CreateAccountScreen(),
      ),

      GoRoute(
        path: RouteName.clientHome,
        builder: (context, state) => const ClientHomeScreen(),
      ),
      GoRoute(
        path: RouteName.providerHome,
        builder: (context, state) => const ProviderHomeScreen(),
      ),
    ],
  );
}
