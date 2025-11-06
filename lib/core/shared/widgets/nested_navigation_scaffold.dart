import 'package:custom_painter_playground/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedNavigationScaffold extends StatefulWidget {
  const NestedNavigationScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<NestedNavigationScaffold> createState() => _NestedNavigationScaffoldState();
}

class _NestedNavigationScaffoldState extends State<NestedNavigationScaffold> {
  final _selectedIndex = ValueNotifier(0);

  void _onDestinationSelected(int index) {
    _selectedIndex.value = index;

    switch (index) {
      case 0:
        context.go(AppRoutes.explore);
        break;
      case 1:
        context.go(AppRoutes.favorites);
        break;
      case 2:
        context.go(AppRoutes.settings);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, selectedIndex, child) {
          return NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                label: 'Explore',
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'Favorites',
              ),
              const NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
