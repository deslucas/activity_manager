import "dart:async";
import "dart:math";

import "package:flutter/material.dart";

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  final secondsListener = ValueNotifier<int>(0);
  StreamSubscription<int>? timerSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timerSubscription = Stream.periodic(
        Durations.extralong4,
        (value) => value,
      ).listen((value) => secondsListener.value = value);
    });
  }

  double get price {
    return (secondsListener.value / 3600) * 50;
  }

  void pause() {
    timerSubscription?.pause();
  }

  void resume() {
    timerSubscription?.resume();
  }

  @override
  void dispose() {
    secondsListener.dispose();
    timerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Badge(
                  label: Icon(Icons.add, size: 8),
                  child: CircleAvatar(maxRadius: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "descrição da atividade aslkda sldkasjd "
                "laskdja lskdja lskdja sldkja sldkajs ldkajs "
                "dlkasjd laksjd alksjd alksdja lskdja lsdkja sdlkjasd",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2 subatividades",
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "estimado 2h",
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.point_of_sale,
                          size: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "R\$ 100",
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(Random().nextInt(5) + 1, (index) {
                    final color = Colors.accents[Random().nextInt(10)];
                    final luminance = color.computeLuminance();
                    final foregroundColor = luminance >= 0.3
                        ? theme.colorScheme.onBackground
                        : theme.colorScheme.background;
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Chip(
                        clipBehavior: Clip.hardEdge,
                        side: BorderSide.none,
                        color: MaterialStatePropertyAll(
                          Colors.accents[Random().nextInt(10)],
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.all(4),
                        label: Text(
                          "feature",
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: foregroundColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        deleteIcon: Icon(
                          Icons.edit_note_sharp,
                          size: 10,
                          color: foregroundColor,
                        ),
                        onDeleted: () {},
                      ),
                    );
                  }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2023-10-10 10:10",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.watch, size: 10),
                      ValueListenableBuilder<int>(
                        valueListenable: secondsListener,
                        builder: (context, value, _) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              visualDensity: VisualDensity.compact,
                              padding: const EdgeInsets.all(2),
                            ),
                            onPressed: () {
                              if (timerSubscription == null) {
                                return;
                              }
                              if (timerSubscription!.isPaused) {
                                resume();
                                return;
                              }
                              pause();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "${(Duration(seconds: value)).inMinutes}min ",
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.outline,
                                  ),
                                ),
                                Text(
                                  "R\$ ${price.toStringAsPrecision(3)}",
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
