// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Breakpoints.mobile.isBreakpoint(context);

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
            ? Text("Organizations")
            : Row(
                children: [
                  Text("Organizations"),
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
            NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              labelType: NavigationRailLabelType.all,
              useIndicator: false,

              destinations: [
                NavigationRailDestination(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(HugeIconsStroke.home01),
                  ),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(HugeIconsStroke.home01),
                  ),
                  label: Text("Home"),
                ),
              ],
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeFloatingActionButton(),
              ),
              trailingAtBottom: true,
              selectedIndex: 0,
            ),
        ],
      ),
      floatingActionButton: isMobile ? HomeFloatingActionButton() : null,
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              items: [
                BottomNavigationBarItem(icon: Icon(HugeIconsStroke.home01), label: "Home"),
                BottomNavigationBarItem(icon: Icon(HugeIconsStroke.home01), label: "Home"),
              ],
              currentIndex: 0,
            )
          : null,
    );
  }
}

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {}, child: Icon(HugeIconsStroke.add01));
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search Organizations",
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
