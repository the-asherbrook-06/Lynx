// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/navigation_provider.dart';
import 'package:lynx/provider/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Breakpoints.mobile.isBreakpoint(context);

    final isRailExpanded = ref.watch(railExpandedProvider);
    final selectedIndex = ref.watch(railIndexProvider);

    ref.listen(authStateProvider, (_, user) {
      if (user.value == null) {
        Navigator.pushNamedAndRemoveUntil(context, '/welcome', (_) => false);
      }
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 16,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        centerTitle: false,
        title: isMobile
            ? Text("Spaces")
            : Row(
                children: [
                  Text("Spaces"),
                  const SizedBox(width: 18),
                  Expanded(child: HomeSearchBar()),
                ],
              ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
            },
            icon: Icon(HugeIconsStroke.logout01),
          ),
        ],
        bottom: isMobile
            ? PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: Padding(padding: EdgeInsetsGeometry.all(8), child: HomeSearchBar()),
              )
            : null,
      ),
      body: Row(
        children: [
          if (!isMobile)
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: NavigationRail(
                minExtendedWidth: 160,
                extended: isRailExpanded,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
                unselectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
                selectedLabelTextStyle: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                unselectedLabelTextStyle: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                leading: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ref.read(railExpandedProvider.notifier).state = !isRailExpanded;
                      },
                      icon: Icon(
                        isRailExpanded ? HugeIconsStroke.menuCollapse : HugeIconsStroke.menu01,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: HomeFloatingActionButton(
                        key: ValueKey(isRailExpanded),
                        expanded: isRailExpanded,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                destinations: [
                  NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    icon: Icon(HugeIconsStroke.office),
                    label: Text("Spaces"),
                  ),
                  NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    icon: Icon(HugeIconsStroke.message01),
                    label: Text("Chats"),
                  ),
                  NavigationRailDestination(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    icon: Icon(HugeIconsStroke.notification02),
                    label: Text("Alerts"),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  ref.read(railIndexProvider.notifier).state = index;
                },
              ),
            ),
        ],
      ),
      floatingActionButton: isMobile ? HomeFloatingActionButton(expanded: false) : null,
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              items: [
                BottomNavigationBarItem(icon: Icon(HugeIconsStroke.office), label: "Spaces"),
                BottomNavigationBarItem(icon: Icon(HugeIconsStroke.message01), label: "Chats"),
                BottomNavigationBarItem(
                  icon: Icon(HugeIconsStroke.notification02),
                  label: "Alerts",
                ),
              ],
              currentIndex: selectedIndex,
              onTap: (index) {
                ref.read(railIndexProvider.notifier).state = index;
              },
            )
          : null,
    );
  }
}

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key, required this.expanded});

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      isExtended: expanded,
      onPressed: () {},
      label: const Text("New Chat"),
      icon: const Icon(HugeIconsStroke.add01),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search Spaces",
      hintStyle: WidgetStatePropertyAll(
        Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      elevation: WidgetStatePropertyAll(0),
      trailing: [
        Padding(padding: const EdgeInsets.all(8.0), child: Icon(HugeIconsStroke.search01)),
      ],
    );
  }
}
