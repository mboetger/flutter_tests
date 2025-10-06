import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // I discovered this bug when I wanted to make the color of the system navigation bar reflect the
  // modern android behavior: showing the scaffold color.
  // This is why I made the navigation bar transparent here. Though, this line is not necesarry
  // in the reproduction of this bug.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Keyboard Stutter')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Wrap(
                spacing: 10,
                children: [
                  // Here is the deal. Setting any SystemUIMode other than the default one induces
                  // this bug.
                  ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.manual,
                        overlays: SystemUiOverlay.values,
                      );
                    },
                    child: const Text('Default'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.edgeToEdge,
                      );
                    },
                    child: const Text('Edge to Edge'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.immersive,
                      );
                    },
                    child: const Text('Immersive'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.immersiveSticky,
                      );
                    },
                    child: const Text('Immersive Sticky'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemChrome.setEnabledSystemUIMode(
                        SystemUiMode.leanBack,
                      );
                    },
                    child: const Text('Leanback'),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText:
                      'Focus on this TextField and observe the bottom.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: const Size.fromHeight(50),
                child: const ColoredBox(
                  color: Colors.red,
                  child: Center(
                    child: Text('Observe the behavior of this bar.'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
