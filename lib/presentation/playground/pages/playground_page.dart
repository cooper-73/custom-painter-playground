import 'package:custom_painter_playground/core/core.dart';
import 'package:custom_painter_playground/presentation/playground/playground.dart';
import 'package:flutter/material.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({
    super.key,
    required this.patternKind,
  });

  final PatternKind patternKind;

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  late ValueNotifier<double> _painterCanvasExtent;

  @override
  void initState() {
    super.initState();
    _painterCanvasExtent = ValueNotifier(
      _hasPainterControls
          ? PainterControllerSheet.defaultChildSize
          : PainterControllerSheet.minimumChildSize,
    );
  }

  List<Widget> get _painterControls => [];

  bool get _hasPainterControls => _painterControls.isNotEmpty;

  bool _handleDraggableScrollableNotification(DraggableScrollableNotification notification) {
    _painterCanvasExtent.value = notification.extent;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bodyPadding: EdgeInsets.zero,
      centerTitle: true,
      bottomSafeArea: false,
      title: widget.patternKind.title,
      body: NotificationListener<DraggableScrollableNotification>(
        onNotification: _handleDraggableScrollableNotification,
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: _painterCanvasExtent,
              builder: (context, extent, child) => PainterCanvas(extent: extent),
            ),
            PainterControllerSheet(
              animationControls: const AnimationControls(),
              painterControls: _painterControls,
            ),
          ],
        ),
      ),
    );
  }
}
