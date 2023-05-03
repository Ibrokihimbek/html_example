import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlFranchisingPage extends StatefulWidget {
  const HtmlFranchisingPage({super.key});

  @override
  State<HtmlFranchisingPage> createState() => _HtmlFranchisingPageState();
}

class _HtmlFranchisingPageState extends State<HtmlFranchisingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget from HTML (core)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HtmlWidget(
          '''
<p><strong>Установи автоматы с повербанками в твоем городе и зарабатывай вместе с нами!</strong></p><p><br></p><p><a href=\"https://youtube.com\" rel=\"noopener noreferrer\" target=\"_blank\">Оставь заявку</a>, чтобы узнать подробности.</p><p>«q.watt» поделится опытом и поможет тебе развить собственную сеть автоматов с повербанками. Без маркетинговых сборов и скрытых вычетов.</p><p><br></p><p>Сотрудничество с «q.watt» - это:</p><p><br></p><p>Дополнительный трафик и доход</p><p><br></p><p>Твое заведение будет на карте наших зарядных станций - каждый месяц.</p>
''',
          onTapUrl: (url) async {
            Uri uri = Uri.parse(url);
            return await launchUrl(uri, mode: LaunchMode.externalApplication);
          },
          customWidgetBuilder: (e) {
            if (!e.classes.contains('carousel')) {
              return null;
            }
          },
        ),
      ),
    );
  }
}
