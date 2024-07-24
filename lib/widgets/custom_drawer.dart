import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://www.dresseldivers.com/wp-content/uploads/buceo-recreativo-ppal-900x480.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Marc Flow',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      side: BorderSide(color: Colors.teal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Favorite location",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.info_outline, size: 16, color: Colors.black),
                  ],
                ),
                Text(
                  "Cullera",
                  style: TextStyle(color: Colors.teal, fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  "Add/Change Location",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Manage locations"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                    side: BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                Divider(
                  color: Colors.teal,
                ),
              ],
            ),
          ),
          _createDrawerItem(icon: Icons.person, text: 'Profile', onTap: () {}),
          _createDrawerItem(icon: Icons.book, text: 'Logbook', onTap: () {}),
          _createDrawerItem(icon: Icons.report, text: 'Reports', onTap: () {}),
          _createDrawerItem(icon: Icons.contact_mail, text: 'Contact us', onTap: () {}),
          _createDrawerItem(icon: Icons.help, text: 'How it works', onTap: () {}),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Custom Drawer Example')),
      drawer: CustomDrawer(),
      body: Center(child: Text('Home Page')),
    ),
  ));
}
