import 'package:go_router/go_router.dart';
import 'package:animations/animations.dart';
import 'package:zooventure/app/pages/authentication/login_page.dart';
import 'package:zooventure/app/pages/authentication/signup_page.dart';
import 'package:zooventure/app/pages/home/home_page.dart';
import 'package:zooventure/app/pages/home/main_page.dart';
import 'package:zooventure/app/pages/kbs/detail_campaign_page.dart';
import 'package:zooventure/app/pages/kbs/kbs_campaign_page.dart';
import 'package:zooventure/app/pages/kbs/kbs_journey_page.dart';
import 'package:zooventure/app/pages/kbs/kbs_maps_page.dart';
import 'package:zooventure/app/pages/onboarding/onboarding_page.dart';
import 'package:zooventure/app/pages/point/point_page.dart';
import 'package:zooventure/app/pages/profile/profile_page.dart';

import 'route_name.dart';
import 'route_path.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: RoutePath.onboardingPage,
    name: RouteName.onboardingPage,
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: RoutePath.loginPage,
    name: RouteName.loginPage,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const LoginPage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RoutePath.signupPage,
    name: RouteName.signupPage,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const SignupPage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RoutePath.mainPage,
    name: RouteName.mainPage,
    builder: (context, state) => MainPage(),
  ),
  GoRoute(
    path: RoutePath.homePage,
    name: RouteName.homePage,
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: RoutePath.kbsMapsPage,
    name: RouteName.kbsMapsPage,
    builder: (context, state) => const KBSMapsPage(),
  ),
  GoRoute(
    path: RoutePath.pointPage,
    name: RouteName.pointPage,
    builder: (context, state) => const PointPage(),
  ),
  GoRoute(
    path: RoutePath.profilePage,
    name: RouteName.profilePage,
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    path: RoutePath.kbsJourneyPage,
    name: RouteName.kbsJourneyPage,
    builder: (context, state) => const CamnimalBoardPage(),
  ),
  GoRoute(
    path: RoutePath.kbsCampaignPage,
    name: RouteName.kbsCampaignPage,
    builder: (context, state) => const KBSCampaignPage(),
  ),
  GoRoute(
    path: RoutePath.detailCampaignPage,
    name: RouteName.detailCampaignPage,
    builder: (context, state) => const DetailCampaignPage(),
  ),
]);
