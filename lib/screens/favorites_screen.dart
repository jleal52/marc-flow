import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<Map<String, String>> _locations = [
    {
      'title': 'Akumal Beach',
      'description': 'A beautiful beach known for its clear waters and sea turtles.',
      'imageUrl': 'https://www.costacruceros.es/content/dam/costa/costa-magazine/articles-magazine/beaches/playa-del-carmen-beaches/spiaggia-di-akumal_d.jpg.image.1296.974.high.jpg',
    },
    {
      'title': 'Zakynthos Beach',
      'description': 'A stunning beach with crystal clear waters and breathtaking views.',
      'imageUrl': 'https://s2.ppllstatics.com/laverdad/www/multimedia/202206/13/media/cortadas/playa-zakynthos-kJdH-U170402206703Z6E-1248x770@La%20Verdad.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                _locations[_currentPage]['title']!,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _locations.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildLocationCard(
                    context,
                    _locations[index]['imageUrl']!,
                    _locations[index]['title']!,
                    _locations[index]['description']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, String imageUrl, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 36), // Ajuste para que el botón sobresalga
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      // Acción al presionar el botón de cerrar
                    },
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            child: Container(
              width: 140,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón de explorar
                },
                child: Text(
                  'Explore',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF40D3C4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
