// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// const appbarKey = Key('appBar');
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(
//     MaterialApp(home: MyApp()),
//   );
// }

// class StartApp extends StatelessWidget {
//   const StartApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WebViewScreen(
//         url: 'https://leancode.co',
//         title: 'leanCode',
//       ),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'InAppBrowser Example',
//           key: appbarKey,
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => WebViewScreen(
//                   title: 'LeanCode',
//                   url: 'https://leancode.co',
//                   // 'https://academic-master.web.app/'
//                   // 'https://sit.kuhoo.com/losportal/',
//                 ),
//               ),
//             );
//           },
//           child: Text(
//             "Open InAppBrowser",
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WebViewScreen extends StatefulWidget {
//   const WebViewScreen({super.key, required this.title, required this.url});
//   final String title;
//   final String url;
//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (progress) => print('WebView progress: $progress'),
//           onPageStarted: (url) => print('WebView started loading: $url'),
//           onPageFinished: (url) => print('WebView finished loading: $url'),
//           onWebResourceError: (error) => print('WebView error: $error'),
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:patrol_app/location.dart';
import 'package:patrol_app/notification.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:patrol_app/overlay_screen.dart';
// import 'package:patrol_app/webview_screen.dart';
// import 'package:timezone/data/latest.dart' as tz_data;
// import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(const ExampleApp());

  // setUpTimezone();
}

// Future<void> setUpTimezone() async {
//   tz_data.initializeTimeZones();
//   final timezone = await FlutterNativeTimezone.getLocalTimezone();
//   final location = tz.getLocation(timezone);
//   tz.setLocalLocation(location);
// }

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const ExampleHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key, required this.title});

  final String title;

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  var _counter = 0;

  void _incrementCounter([int value = 1]) {
    final newValue = _counter + value;
    setState(() {
      _counter = newValue;
    });
  }

  void _decrementCounter([int value = 1]) {
    final newValue = _counter - value;
    setState(() {
      _counter = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold'),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        key: const Key('listViewKey'),
        children: [
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            key: const Key('counterText'),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const TextField(
            key: Key('textField'),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'You have entered this text',
            ),
          ),
          SizedBox(height: 8),
          Container(
            key: const Key('box1'),
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('box 1'),
                ListTile(
                  onTap: () => _incrementCounter(10),
                  key: const Key('tile1'),
                  title: const Text('Add'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add, key: Key('icon1')),
                    onPressed: _incrementCounter,
                  ),
                ),
                ListTile(
                  onTap: () => _decrementCounter(10),
                  key: const Key('tile2'),
                  title: const Text('Subtract'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove, key: Key('icon2')),
                    onPressed: _decrementCounter,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            key: const Key('box2'),
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('box 2'),
                ListTile(
                  onTap: () => _incrementCounter(10),
                  key: const Key('tile1'),
                  title: const Text('Add'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add, key: Key('icon1')),
                    onPressed: _incrementCounter,
                  ),
                ),
                ListTile(
                  onTap: () => _decrementCounter(10),
                  key: const Key('tile2'),
                  title: const Text('Subtract'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove, key: Key('icon2')),
                    onPressed: _decrementCounter,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open loading screen'),
          ),
          TextButton(
            onPressed: () async => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LocationScreen(),
              ),
            ),
            child: const Text('Open location screen'),
          ),
          TextButton(
            onPressed: () async => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const NotificationsScreen(),
              ),
            ),
            child: const Text('Open notifications screen'),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open overlay screen'),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open scrolling screen'),
          ),
          // TextButton(
          //   onPressed: () async => Navigator.of(context).push(
          //     MaterialPageRoute<void>(
          //       builder: (_) => const WebViewScreen(
          //         title: 'WebView (LeanCode)',
          //         url: 'https://leancode.co',
          //       ),
          //     ),
          //   ),
          //   child: const Text('Open webview (LeanCode)'),
          // ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open webview (Hacker News)'),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open webview (StackOverflow)'),
          ),
          TextButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute<void>(
              //     builder: (_) => const OverlayScreen(),
              //   ),
              // );
            },
            child: const Text('Open permissions screen'),
          ),
          Text('EXAMPLE_KEY: ${const String.fromEnvironment('EXAMPLE_KEY')}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
