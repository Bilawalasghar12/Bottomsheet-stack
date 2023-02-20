import 'package:flutter/material.dart';

import 'bottom sheet.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: InkWell(
              onTap: () {
                print('hii');
                showModalBottomSheet(
                    isScrollControlled: true,

                    context: context,
                    builder: (BuildContext bc) {
                      return Bottomsheet();
                    });
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomsheet()));
              },
            ),
          )
        ],
      ),
    );
  }
}
