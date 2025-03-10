import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../themes/theme_extension.dart';
import '../../../routing/routes.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>()!;

    return Scaffold(
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppBar(
                    leadingWidth: 48,
                    leading: Image.asset(
                      "assets/images/YumeLogo.png",
                    ),
                    // * Profile Picture
                    actions: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.foregroundHigh,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Java.png"),
                            radius: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(child: child),
              SafeArea(
                child: NavigationBar(
                  destinations: [
                    NavigationDestination(
                        icon: Icon(
                          Icons.schedule_rounded,
                        ),
                        label: 'Chrono'),
                    NavigationDestination(
                        icon: Icon(Icons.dashboard_rounded), label: 'Habits'),
                    NavigationDestination(
                        icon: Icon(Icons.area_chart_rounded),
                        label: 'Analytics'),
                    NavigationDestination(
                        icon: Icon(Icons.add_task_rounded), label: 'Tasks'),
                  ],
                  selectedIndex: _getSelectedIndex(context),
                  onDestinationSelected: (index) {
                    _onTabSelected(context, index);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouter.of(context).routeInformationProvider.value.uri.toString();
    switch (location) {
      case Routes.chrono:
        return 0;
      case Routes.habits:
        return 1;
      case Routes.analytics:
        return 2;
      case Routes.tasks:
        return 3;
      case Routes.settings:
        return 4;
      default:
        return 0;
    }
  }

  void _onTabSelected(BuildContext context, index) {
    switch (index) {
      case 0:
        context.go(Routes.chrono);
      case 1:
        context.go(Routes.habits);
      case 2:
        context.go(Routes.analytics);
      case 3:
        context.go(Routes.tasks);
      case 4:
        context.go(Routes.settings);
    }
  }
}
