import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  runApp(const MyApp());
}

Color OurColor = Color(0XFF171A9E); // color if there is no dynamic color scheme

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      // DynamicColorBuilder is a widget that provides a dynamic color scheme to its child.
      builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
        // lightDynamic is the dynamic color scheme for light mode.
        // dark is the color scheme for dark mode.
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && dark != null) {
          // If both light and dark color schemes are provided, we can use them to create a harmonized color scheme.
          lightColorScheme = lightDynamic.harmonized()..copyWith();
          lightColorScheme = lightColorScheme.copyWith(secondary: OurColor);
          darkColorScheme = dark.harmonized();
        } else {
          // If only one color scheme is provided, we can use it to create a harmonized color scheme.
          lightColorScheme = ColorScheme.fromSeed(seedColor: OurColor);
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: OurColor,
            brightness: Brightness.dark,
          );
        }

        return MaterialApp(
          title: 'Title of the app',
          theme: ThemeData(
            useMaterial3: true, // Enable Material 3
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
          ),
          home: const MyHomePage(
            title: 'Title of the page',
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
