import 'package:flutter/material.dart';
import 'package:get_rice/page2.dart';
import 'package:get_rice/page3.dart';

import 'Current.dart';
import 'Past.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center buttons horizontally
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add functionality for button 1 press
                },
                child: Text('History'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize:
                      Size(150, 50), // Set a fixed size for both buttons
                ),
              ),
              SizedBox(width: 20), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Add functionality for button 2 press
                },
                child: Text('Test Your Paddy Field'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: Size(150, 50), // Set the same fixed size
                ),
              ),
            ],
          ),
        ],
      ),

      // bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Color(0XFF03A9F4),
      shape: CircularNotchedRectangle(), // Notch for floating action button
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage())), // Go to home page
          ),
          IconButton(
            icon:
                Icon(Icons.account_box), // Replace with desired icon for page 2
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Page2())), // Navigate to Page2 (replace with your page class)
          ),
          SizedBox(width: 20), // Spacing between icons
          IconButton(
            icon: Icon(Icons.settings), // Replace with desired icon for page 3
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Page3())), // Navigate to Page3 (replace with your page class)
          ),
        ],
      ),
    );
  }
}

class BackgroundImageHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to fill the screen
      height: double.infinity, // Set height to fill the screen
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1595974482597-4b8da8879bc5?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFkZHklMjBmaWVsZHxlbnwwfHwwfHx8MA%3D%3D'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(
          child: Text(
        cardName,
        style: TextStyle(
          color: Colors.white,
        ),
      )),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'GetPastData',
          ),
        ],
      ),
      body: <Widget>[
        BackgroundImageHomePage(),
        CurrentPage(),
        Past(),
      ][currentPageIndex],
    );
  }
}
