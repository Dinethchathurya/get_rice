import 'package:flutter/material.dart';
import 'package:get_rice/page2.dart';
import 'package:get_rice/page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.indigoAccent[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center buttons horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for button 1 press
                  },
                  child: Text('History'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    minimumSize: Size(150, 50), // Set a fixed size for both buttons
                  ),
                ),
                SizedBox(width: 20), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for button 2 press
                  },
                  child: Text('SET'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    minimumSize: Size(150, 50), // Set the same fixed size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(), // Notch for floating action button
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())), // Go to home page
          ),
          IconButton(
            icon: Icon(Icons.account_box), // Replace with desired icon for page 2
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Page2())), // Navigate to Page2 (replace with your page class)
          ),
          SizedBox(width: 20), // Spacing between icons
          IconButton(
            icon: Icon(Icons.settings), // Replace with desired icon for page 3
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Page3())), // Navigate to Page3 (replace with your page class)
          ),
        ],
      ),
    );
  }
}
