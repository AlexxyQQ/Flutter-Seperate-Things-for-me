# Material You in Flutter

<b> Dependencies used [Dynamic Color](https://pub.dev/packages/dynamic_color) </b> <br>

Refrence: [Youtube Video](https://www.youtube.com/watch?v=n0axxcXQB0c)

- Step 1:<br>
  Add dependencies
  ```txt
  dynamic_color
  ```
  in dependencies
  <hr>
  <img src = "assets/Readme Images/Dep.png">
  <hr>
- Step 2:<br>
  Import the package in the main.dart file

  ```dart
  import 'package:dynamic_color/dynamic_color.dart';
  ```

  <hr>
  <img src = "assets/Readme Images/dc_imp.png">
  <hr>

- Step 3:<br>
  use this code to get the dynamic color

  ```dart

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

  ```

  <hr>


## Where to paste the code?
  replace this code in the main.dart file with the above code
  <hr>
  <img src = "assets/Readme Images/rep_code.png">
  <hr>
  
## SHA-1
``` bash
./gradlew app:signingReport
```
