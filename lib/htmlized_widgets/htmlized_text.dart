// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'htmilized_widget.dart';

class HtmlizedText extends HtmlizedWidget {
  const HtmlizedText({
    required super.child,
    required this.text,
    super.id = 'text',
    super.key,
  });

  final String text;

  @override
  HtmlizedTextState createState() => HtmlizedTextState();
}

class HtmlizedTextState extends HtmlizedWidgetState<HtmlizedText> {
  @override
  Element getHtmlElement() => CanvasElement()..attributes = {
    'type': 'text',
    'value': widget.text,
  };
}
