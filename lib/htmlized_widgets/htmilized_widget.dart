// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:easy_robot/helpers/renderer_state.dart';
import 'package:easy_robot/helpers/size_widget.dart';
import 'package:flutter/material.dart';

abstract class HtmlizedWidget extends StatefulWidget {
  const HtmlizedWidget({
    required this.child,
    required this.id,
    super.key,
  });

  final Widget child;
  final String id;

  @override
  HtmlizedWidgetState createState();
}

abstract class HtmlizedWidgetState<T extends HtmlizedWidget>
    extends RendererState<T> {
  html.Element getHtmlElement();

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.id,
      (_) => getHtmlElement()
        ..attributes = {'id': widget.id, ...getHtmlElement().attributes}
        ..style.opacity = '0'
        ..style.width = '${size?.width ?? 0}px'
        ..style.height = '${size?.height ?? 0}px',
    );

    return SizedBox.fromSize(
      size: size,
      child: Stack(
        children: [
          SizeWidget(onSize: onSize, child: widget.child),
          if (size != null && visible)
            IgnorePointer(child: HtmlElementView(viewType: widget.id)),
        ],
      ),
    );
  }
}
