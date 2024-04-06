import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_rice/Services/Bluetooth/bluetooth_manager.dart';
import 'package:provider/provider.dart';

import 'Screens/BottomSheet.dart';

import 'package:get_rice/Screens/Current.dart';
import 'package:get_rice/Screens/Past.dart';

import 'Screens/AnalysisResultScreen.dart';

import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
import 'Services/FertilizerCalculate.dart';
import 'Services/GetLocation.dart';
import 'Services/GetResults.dart';
import 'Services/StoreResults.dart';
import 'Services/WeatherCalculate.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAN8Prxr5CqZgd13QgcAzTqJAz-8XAlBXk',
        appId: '1:548925235872:android:6535a812452c5b83ce1fc5',
        messagingSenderId: '548925235872',
        projectId: 'get-rice',
        storageBucket: 'get-rice.appspot.com',
      ));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FertilizerCalculate>(
          create: (context) => FertilizerCalculate(),
        ),
        ChangeNotifierProvider<StoreData>(
          create: (context) => StoreData(),
        ),
        ChangeNotifierProvider<Weather>(
          create: (context) => Weather(),
        ),
        ChangeNotifierProvider<GetLocation>(
          create: (context) => GetLocation(),
        ),
      ],
      builder: (BuildContext context, Widget) {
        return MaterialApp(
          theme: ThemeData.light(),
          initialRoute: '/testBluetooth',
          routes: {
            '/': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/FertilizerCalculateScreen': (context) =>
                FertilizerCalculateScreen(),
            '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),
            '/testhome': (context) => TestHome(),
            '/testBluetooth': (context) => BluetoothHome(),
            '/bottomSheet': (context) => BottomSheetWidget(),
            '/result': (context) => resultScreen(),
            'CurrentPage': (context) => CurrentPage(),
            '/result': (context) => resultScreen(),
            'CurrentPage': (context) => CurrentPage(),
            '/past': (context) => Past(),
          },
        );
      },
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: Text('click'),
            onPressed: () async {
              GetResult getResult = GetResult();
              getResult.getResultFromFirebse();

              // StoreData storeData = StoreData();
              // storeData.store();
            }

            // FertilizerCalculate fertilizerCalculate = FertilizerCalculate();
            // await fertilizerCalculate.calculate(); // Call necessary method
            // await Provider.of<Weather>(context, listen: false).getData(context);
            // StoreResults storeResults = StoreResults();
            // storeResults.store(
            //   context,
            //   rainyDates:
            //       Provider.of<Weather>(context, listen: false).rainyDates,
            //   nitrogen: Provider.of<FertilizerCalculate>(context, listen: false)
            //       .isNeedToFeedNitrogen,
            //   phosphorus:
            //       Provider.of<FertilizerCalculate>(context, listen: false)
            //           .isNeedToFeedPhosphorus,
            //   potassium:
            //       Provider.of<FertilizerCalculate>(context, listen: false)
            //           .isNeedToFeedPotassium,
            //   ph: Provider.of<FertilizerCalculate>(context, listen: false)
            //       .isNeedToFeedPh,
            // );

            ),
      ),
    );
  }
}
class BluetoothHome extends StatefulWidget {
  const BluetoothHome({super.key});

  @override
  State<BluetoothHome> createState() => _BluetoothHomeState();
}
//this class for test bluetooth part
//dushan
class _BluetoothHomeState extends State<BluetoothHome> {
  BluetoothManager bluetoothManager = BluetoothManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        title: const Text("BT Serial"),
        elevation: 4.0,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 80.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _connected ? 'Connected' : 'Disconnected',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FilledButton(
                            onPressed: _connected
                                ? bluetoothManager.disconnectFromDevice
                                : _showDeviceListPopup,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade400),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                            child: Text(
                                _connected ? 'Disconnect' : 'Select Device'),
                          )
                        ],
                      ),
                      if (_connected)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Device: ${_connectedDevice.name}"),
                            Text(
                              _connectedDevice.address.toString(),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black38),
                            )
                          ],
                        )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FilledButton(
                            onPressed: () {
                              _connected ? _sendData("5") : null;
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade400),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                            child: Text("Read Data"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nitrogen: ",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  "Phosphorus: ",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  "Potassium: ",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  "PH: ",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                bluetoothManager.nitro,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                bluetoothManager.pos,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                bluetoothManager.pota,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                bluetoothManager.ph,
                                style: const TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
  //all the functions are there to read bluetooth values.
  //to read all values pass number 5(String) using _sendData() function
  //then, received data print on display.
  //no need to call function to read data.

  @override
  void initState() {
    super.initState();
    bluetoothManager.isBluetoothEnabled();
  }
  void _sendData(String data){
    bluetoothManager.sendData(data: data);
  }
  bool get _connected => bluetoothManager.connected;
  BluetoothDevice get _connectedDevice=>bluetoothManager.connectedDevice;
  FlutterBluetoothSerial get bluetooth => bluetoothManager.bluetooth;

  Future<void> _showDeviceListPopup() async {
    bluetooth.cancelDiscovery(); // Cancel any ongoing discovery

    List<BluetoothDevice> devices = [];

    try {
      devices = await bluetooth.getBondedDevices();
    } catch (ex) {
      print("Error getting bonded devices: $ex");
    }

    if (devices.isEmpty) {
      print("No bonded devices available");
      return;
    }

    BluetoothDevice selectedDevice = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a device'),
          content: Column(
            children: <Widget>[
              for (BluetoothDevice device in devices)
                ListTile(
                  title: Text(device.name.toString()),
                  subtitle: Text(device.address),
                  onTap: () {
                    Navigator.pop(context, device);
                  },
                ),
            ],
          ),
        );
      },
    );

    if (selectedDevice != null) {
      await bluetoothManager.connectToDevice(selectedDevice);
    }
  }


}

