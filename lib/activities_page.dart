import "package:flutter/material.dart";

import "widgets/status_list_widget.dart";

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const StatusListWidget(label: "Nome do status");
      },
      separatorBuilder: (context, index) {
        return const SizedBox.square(dimension: 15);
      },
      itemCount: 7,
    );
  }
}
