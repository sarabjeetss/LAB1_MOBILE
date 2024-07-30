import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'Welcome to Amritsar Hub',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<String> _pageTitles = <String>[
    'Golden Temple',
    'Jallianwala Bagh',
    'Sada Pind',
  ];

  static const List<Widget> _pages = <Widget>[
    PageContent(
      imagePath: 'assets/img1.jpg',
      text:
      'Immerse yourself in the serene beauty and spiritual ambiance of the Golden Temple, a timeless symbol of peace and unity in Amritsar. Explore the stunning architecture and enjoy the harmonious sounds of the Sikh hymns. Don\'t miss the opportunity to partake in the community kitchen that feeds thousands daily. Witness the mesmerizing evening ceremony, where the sacred rituals are performed with grace and devotion. Feel the tranquility as you walk around the holy pond, and embrace the spirituality that pervades this revered site. The Golden Temple offers a profound experience that stays with you long after you leave. This place is not only a spiritual sanctuary but also a symbol of hope and resilience for many. Each visit deepens your connection to its rich history and vibrant present.',
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    PageContent(
      imagePath: 'assets/img2.jpg',
      text:
      'Reflect on the courage and sacrifice at Jallianwala Bagh, a poignant reminder of India\'s struggle for freedom and resilience. Walk through the historic site and see the preserved bullet marks. This memorial park offers a solemn reminder of the past with beautiful gardens. Discover the inspiring stories of the brave souls who stood up for their country. The tranquil setting contrasts deeply with the tragic events it commemorates. Experience the peace that now envelops this historic site, which serves as a beacon of hope and remembrance. The garden’s design and layout are thoughtfully crafted to provide a space for reflection and learning. It’s a powerful testament to the strength of human spirit in the face of adversity.',
      textStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
    ),
    PageContent(
      imagePath: 'assets/img3.jpg',
      text:
      'Experience the vibrant culture and warm hospitality of Punjab at Sada Pind, a lively heritage village celebrating the spirit of Amritsar. Engage in traditional Punjabi folk dances and taste authentic Punjabi cuisine. Sada Pind provides a delightful experience of rural life with numerous cultural activities. Take part in interactive workshops like traditional craft making and pottery. Enjoy folk music and dance performances that showcase the rich cultural heritage of Punjab. Relish the flavors of authentic Punjabi dishes prepared with traditional methods, making your visit truly immersive and enjoyable. The engaging activities and warm atmosphere offer a genuine glimpse into Punjabi traditions and community life. Don’t forget to visit the local shops for unique handmade souvenirs that reflect the region’s vibrant artistry.',
      textStyle: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selecting a page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_selectedIndex],
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Amritsar Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.temple_hindu, color: Colors.indigo),
              title: const Text('Golden Temple'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.indigo),
              title: const Text('Jallianwala Bagh'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.indigo),
              title: const Text('Sada Pind'),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class PageContent extends StatelessWidget {
  final String imagePath;
  final String text;
  final TextStyle textStyle;

  const PageContent({
    super.key,
    required this.imagePath,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 40), // Increase space above the image
          Image.asset(imagePath, height: 300, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.call),
                onPressed: () {
                  // Handle call action
                },
              ),
              IconButton(
                icon: const Icon(Icons.map),
                onPressed: () {
                  // Handle route action
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Handle share action
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
