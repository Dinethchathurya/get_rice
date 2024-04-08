import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/GetResults.dart';
import 'bluetooth_screen.dart';

class BackgroundImageHomePage extends StatelessWidget {
  const BackgroundImageHomePage({super.key});

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
        BluetoothScreen(),
        GetData(),
      ][currentPageIndex],
    );
  }
}

class GetData extends StatefulWidget {
  const GetData({Key? key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    activateGetData();
    // Fetch data when the widget is initialized
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  activateGetData() async {
    await Provider.of<GetResult>(context, listen: false).getResultFromFirebse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Provider.of<GetResult>(context, listen: false).appRefresh();
          },
          label: Text('Re-Fresh')),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 169, 244),
        title: const Center(
          child: Text(
            "Data History",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<GetResult>(context).userData.length,
                itemBuilder: (context, index) {
                  var data = Provider.of<GetResult>(context).userData[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Date: ${data['date']}'),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Potassium: ${data['potassium']}'),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Nitrogen: ${data['nitrogen']}'),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('pH: ${data['ph']}'),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Phosphorus: ${data['phosphorus']}'),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('Dates: ${data['dates']}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
