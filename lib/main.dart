
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
      title: 'Responsive UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5271FF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FC),
          foregroundColor: Color(0xFF26345C),
          centerTitle: false,
        ),
      ),
      home: const ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  final List<Map<String, dynamic>> cards = const [
    {
      'title': 'Dashboard',
      'description': 'View your overview and activity.',
      'icon': Icons.dashboard_rounded,
      'color': Color(0xFF5271FF),
    },
    {
      'title': 'Analytics',
      'description': 'Explore your data and insights.',
      'icon': Icons.bar_chart_rounded,
      'color': Color(0xFF20A67A),
    },
    {
      'title': 'Messages',
      'description': 'Keep track of your conversations.',
      'icon': Icons.chat_bubble_outline_rounded,
      'color': Color(0xFFFF9F43),
    },
    {
      'title': 'Settings',
      'description': 'Personalize your experience.',
      'icon': Icons.settings_rounded,
      'color': Color(0xFF9561D9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Responsive UI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0xFFE3E9FF),
              child: Icon(
                Icons.person_outline,
                color: Color(0xFF5271FF),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final columns = width >= 900
              ? 4
              : width >= 600
              ? 2
              : 1;

          return SingleChildScrollView(
            padding: EdgeInsets.all(width < 600 ? 16 : 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF26345C),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Explore your workspace on any screen.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your workspace',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cards.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 190,
                  ),
                  itemBuilder: (context, index) {
                    final card = cards[index];

                    return _buildCard(
                      title: card['title'] as String,
                      description: card['description'] as String,
                      icon: card['icon'] as IconData,
                      color: card['color'] as Color,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8ECF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26345C),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF738099),
            ),
          ),
        ],
      ),
    );
  }
}
