import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/weather_widget.dart';
import '../widgets/location_card.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    FavoritesScreen(),
    SearchScreen(),
    MapsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello John',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "It's a little cloudy today.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for the best fishing spots...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF4F4F9),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Color(0xFF40D3C4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.location_on, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20),
          WeatherWidget(),
          SizedBox(height: 20),
          Text(
            'Locations.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterChip(
                label: Text('All'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.grey[200],
                selectedColor: Color(0xFF40D3C4),
              ),
              FilterChip(
                label: Text('Recently'),
                selected: true,
                onSelected: (_) {},
                backgroundColor: Colors.grey[200],
                selectedColor: Color(0xFF40D3C4),
              ),
              FilterChip(
                label: Text('Favorites'),
                selected: false,
                onSelected: (_) {},
                backgroundColor: Colors.grey[200],
                selectedColor: Color(0xFF40D3C4),
              ),
            ],
          ),
          SizedBox(height: 20),
          LocationCard(),
          LocationCard(),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen'),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Maps Screen'),
    );
  }
}
