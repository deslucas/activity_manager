import "package:flutter/material.dart";

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    super.key,
    this.sideBar,
    this.appBar,
    this.sideBarMaxWidth,
    required this.body,
    this.sideBarAsDrawer = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? sideBar;
  final Widget body;
  final double? sideBarMaxWidth;
  final bool sideBarAsDrawer;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBar,
      drawer: sideBar ?? const SizedBox.shrink(),
      body: Row(
        children: [
          if (size.width > 600) sideBar ?? const SizedBox.shrink(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
