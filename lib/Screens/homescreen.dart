import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/GetResults.dart';
import 'Current.dart';

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
        CurrentPage(),
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
    List userData = Provider.of<GetResult>(context).userData;
    return Scaffold(
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
                        Text('Date: ${data['date']}'),
                        Text('Potassium: ${data['potassium']}'),
                        Text('Nitrogen: ${data['nitrogen']}'),
                        Text('pH: ${data['ph']}'),
                        Text('Dates: ${data['dates']}'),
                        Text('Phosphorus: ${data['phosphorus']}'),
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

// class _GetDataState extends State<GetData> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<GetResult>(context, listen: false).getResultFromFirebse();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List userData = Provider.of<GetResult>(context).userData;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 3, 169, 244),
//         title: const Center(
//           child: Text(
//             "Data History",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: userData.length,
//                 itemBuilder: (context, index) {
//                   var data = userData[index];
//                   return Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Date: ${data['date']}'),
//                         Text('Potassium: ${data['potassium']}'),
//                         Text('Nitrogen: ${data['nitrogen']}'),
//                         Text('pH: ${data['ph']}'),
//                         Text('Dates: ${data['dates']}'),
//                         Text('Phosphorus: ${data['phosphorus']}'),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// SizedBox(
// height: 250,
// width: double.infinity,
// child: Card(
// elevation: 4.0,
// child: Padding(
// padding: const EdgeInsets.all(12.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Weather Details',
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(height: 12.0),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("Rain (Previous):"),
// Container(
// width: 60,
// height: 60,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Color.fromARGB(255, 197, 202, 233),
// ),
// padding: EdgeInsets.all(8.0),
// child: Center(
// child: Text(
// weatherDetail.rainPrevious,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 12.0),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("Date:"),
// Container(
// padding: EdgeInsets.symmetric(
// vertical: 8.0, horizontal: 16.0),
// decoration: BoxDecoration(
// color: Color.fromARGB(255, 197, 202, 233),
// borderRadius: BorderRadius.circular(30.0),
// ),
// child: Text(
// weatherDetail.date,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 12.0),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("Time:"),
// Container(
// padding: EdgeInsets.symmetric(
// vertical: 8.0, horizontal: 36.0),
// decoration: BoxDecoration(
// color: Color.fromARGB(255, 197, 202, 233),
// borderRadius: BorderRadius.circular(30.0),
// ),
// child: Text(
// weatherDetail.time,
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// );
//
//

// class GetData extends StatelessWidget {
//   const GetData({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     late List weatherDetailsList = ['hello', 'hello', 'ooo'];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 03, 169, 244),
//         title: const Center(
//           child: Text(
//             "Data History",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Container(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 189, 189, 189),
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   child: const Text(
//                     "Weather",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               ListView.builder(
//                 itemCount: weatherDetailsList.length,
//                 itemBuilder: (context, index) {
//                   var weatherDetail = weatherDetailsList[
//                       index]; // Assuming weatherDetailsList is a List containing your weather details data
//                   return SizedBox(
//                     height: 250,
//                     width: double.infinity,
//                     child: Card(
//                       elevation: 4.0,
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Weather Details',
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 12.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Rain (Previous):"),
//                                 Container(
//                                   width: 60,
//                                   height: 60,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Color.fromARGB(255, 197, 202, 233),
//                                   ),
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Center(
//                                     child: Text(
//                                       weatherDetail.rainPrevious,
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 12.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Date:"),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 16.0),
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 197, 202, 233),
//                                     borderRadius: BorderRadius.circular(30.0),
//                                   ),
//                                   child: Text(
//                                     weatherDetail.date,
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 12.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Time:"),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 36.0),
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 197, 202, 233),
//                                     borderRadius: BorderRadius.circular(30.0),
//                                   ),
//                                   child: Text(
//                                     weatherDetail.time,
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
