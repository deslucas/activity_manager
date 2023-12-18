import "dart:math";

import "package:flutter/material.dart";

import "activity_widget.dart";

class StatusListWidget extends StatefulWidget {
  const StatusListWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<StatusListWidget> createState() => _StatusListWidgetState();
}

class _StatusListWidgetState extends State<StatusListWidget> {
  bool expanded = true;

  void switchExpanded(bool value) {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromWidth(280),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Status"),
                  ExpandIcon(onPressed: switchExpanded),
                ],
              ),
            ),
          ),
          SizedBox.fromSize(size: const Size.fromRadius(10)),
          Expanded(
            child: Visibility(
              visible: expanded,
              child: ListView.separated(
                itemCount: Random().nextInt(15) + 5,
                separatorBuilder: (context, index) {
                  return SizedBox.fromSize(size: const Size.square(10));
                },
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ActivityWidget(
                    key: Key(index.toString()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
