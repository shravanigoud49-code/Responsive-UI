import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive UI"),
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {

          double width = MediaQuery.of(context).size.width;

          return Column(
            children: [

              Text(
                "Screen Width: ${width.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                child: orientation == Orientation.portrait

                    ? Column(
                  children: [
                    demoCard("Card 1", Colors.blue),
                    demoCard("Card 2", Colors.green),
                    demoCard("Card 3", Colors.orange),
                  ],
                )

                    : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: demoCard("Card 1", Colors.blue),
                        ),
                        Expanded(
                          child: demoCard("Card 2", Colors.green),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: demoCard("Card 3", Colors.orange),
                        ),
                        Expanded(
                          child: demoCard("Card 4", Colors.purple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget demoCard(String title, Color color) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
