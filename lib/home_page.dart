import "package:flutter/material.dart";

import "activities_page.dart";
import "widgets/responsive_scaffold.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveScaffold(
      // sideBar: Container(
      //   color: Theme.of(context).colorScheme.primaryContainer,
      //   width: 250,
      // ),
      body: SafeArea(child: ActivitiesPage()),
    );
  }
}
