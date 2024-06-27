// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'htmilized_widget.dart';

class HtmlizedButton extends HtmlizedWidget {
  const HtmlizedButton({
    required super.child,
    required this.enable,
    super.id = 'text',
    super.key,
  });

  final bool enable;

  @override
  HtmlizedButtonState createState() => HtmlizedButtonState();
}

class HtmlizedButtonState extends HtmlizedWidgetState<HtmlizedButton> {
  @override
  Element getHtmlElement() => CanvasElement()
    ..attributes = {
      'type': 'button',
      'enable': widget.enable.toString(),
    };
}
