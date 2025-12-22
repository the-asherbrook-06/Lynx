// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/navigation_provider.dart';
import 'package:lynx/provider/auth_provider.dart';

// Pages
import 'package:lynx/pages/spaces_page.dart';
import 'package:lynx/pages/chats_page.dart';
import 'package:lynx/pages/alerts_page.dart';

class NavPage {
  final String name;
  final IconData icon;
  final Widget page;

  const NavPage({required this.name, required this.icon, required this.page});
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = <NavPage>[
      NavPage(name: 'Spaces', icon: HugeIconsStroke.office, page: SpacesPage()),
      NavPage(name: 'Chats', icon: HugeIconsStroke.message01, page: AlertsPage()),
      NavPage(name: 'Alerts', icon: HugeIconsStroke.notification02, page: ChatsPage()),
    ];

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
            ? Text(pages[selectedIndex].name)
            : Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(pages[selectedIndex].name)),
                  // const SizedBox(width: 8),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 700,
                      ),
                      child: HomeSearchBar(hintText: "Search ${pages[selectedIndex].name}..."),
                    ),
                  ),
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
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: HomeSearchBar(hintText: "Search ${pages[selectedIndex].name}..."),
                ),
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
                destinations: pages.map((page) {
                  return NavigationRailDestination(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    icon: Icon(page.icon),
                    label: Text(page.name),
                  );
                }).toList(),
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  ref.read(railIndexProvider.notifier).state = index;
                },
              ),
            ),
          Expanded(child: pages[selectedIndex].page),
        ],
      ),
      floatingActionButton: isMobile ? HomeFloatingActionButton(expanded: false) : null,
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
              unselectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
              selectedLabelStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
              unselectedLabelStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              items: pages.map((page) {
                return BottomNavigationBarItem(icon: Icon(page.icon), label: page.name);
              }).toList(),
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
  const HomeSearchBar({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText,
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
