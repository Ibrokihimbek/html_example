import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html_example/data/url_launcher.dart';
import 'package:html_example/screens/example_franchising.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlWebPage extends StatefulWidget {
  const HtmlWebPage({super.key});

  @override
  State<HtmlWebPage> createState() => _HtmlWebPageState();
}

class _HtmlWebPageState extends State<HtmlWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget from HTML (core)'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HtmlFranchisingPage(),
                ),
              );
            },
            icon: const Icon(Icons.next_plan),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HtmlWidget(
          '''
 <html>
  <head>
    <title>Example Website</title>
  </head>
  <body>
    <h1>Welcome to Example Website!</h1>
    <p>Check out our <a href="https://pub.dev/packages/flutter_widget_from_html_core">website</a> for more information.</p>
    <img src="https://images.unsplash.com/photo-1519052537078-e6302a4968d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&fit=crop&w=1600&height=900" alt="Example Image">
    <p>This is an example image.</p>
  </body>

''',
          onTapUrl: (url) async {
            Uri uri = Uri.parse(url);
            return await launchUrl(uri, mode: LaunchMode.externalApplication);
          },
        ),
      ),
    );
  }
}
