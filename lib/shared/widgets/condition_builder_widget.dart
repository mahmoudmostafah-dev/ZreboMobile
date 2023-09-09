import 'package:flutter/material.dart';

class ConditionBuilderWidget extends StatelessWidget {
  const ConditionBuilderWidget({
    Key? key,
    required this.condition,
    required this.builder,
    this.fallback,
  }) : super(key: key);

  final bool condition;
  final WidgetBuilder builder;
  final WidgetBuilder? fallback;

  @override
  Widget build(BuildContext context) {
    return condition
        ? builder(context)
        : fallback != null
            ? fallback!(context)
            : Container();
  }
}
