import 'package:flutter/material.dart';

class GetWidgetPosition extends StatefulWidget {
  final Widget child;
  final Function(WidgetProperties) location;
  const GetWidgetPosition(
      {Key? key, required this.child, required this.location})
      : super(key: key);

  @override
  _GetWidgetPositionState createState() => _GetWidgetPositionState();
}

class _GetWidgetPositionState extends State<GetWidgetPosition> {
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
      Offset? position = box.localToGlobal(Offset.zero);
      widget.location(WidgetProperties(position, box.size));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      key: key,
      children: [
        widget.child,
      ],
    );
  }
}

class WidgetProperties {
  Offset position;
  Size size;
  WidgetProperties(this.position, this.size);
}
