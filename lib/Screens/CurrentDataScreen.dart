import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({Key? key}) : super(key: key);

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  late BluetoothConnection _connection;
  bool _connected = false;
  late BluetoothDevice _connectedDevice;
  final TextEditingController _typedText = TextEditingController();

  // String _dataReceived = '{"nitro": "0","pos": "0","pota": "0", "ph": "0"}';
  String _nitro = "0";
  String _pos = "0";
  String _pota = "0";
  String _ph = "0";

  // Create four lists of type 'String' to store data about the nutrients.
  List<String> nitrogenData = [];
  List<String> phosphorusData = [];
  List<String> potassiumData = [];
  List<String> phData = [];

  @override
  void initState() {
    super.initState();
    _isBluetoothEnabled();
  }

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
                margin: const EdgeInsets.only(top: 10.0),
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
                              ? _disconnectFromDevice
                              : _showDeviceListPopup,
                          child:
                              Text(_connected ? 'Disconnect' : 'Select Device'),
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
                            _connected ? _sendData(data: "5") : null;
                          },
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
                              _nitro,
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              _pos,
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              _pota,
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              _ph,
                              style: const TextStyle(fontSize: 20.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Display data as cards.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildNutrientCards('Nitrogen', nitrogenData),
                  _buildNutrientCards('Phosphorus', phosphorusData),
                  _buildNutrientCards('Potassium', potassiumData),
                  _buildNutrientCards('pH', phData),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientCards(String nutrient, List<String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nutrient,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Column(
          children: data.map((value) {
            return Card(
              child: ListTile(
                title: Text(value),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<void> _isBluetoothEnabled() async {
    super.initState();
    bool? isAvailable = await _bluetooth.isAvailable;

    if (isAvailable ?? false) {
      // Check if Bluetooth is turned on
      bool? isEnabled = await _bluetooth.isEnabled;

      if (!isEnabled! ?? false) {
        // Request to turn on Bluetooth
        await _bluetooth.requestEnable();
      }
    } else {
      print('Bluetooth is not available on this device.');
    }
  }

  Future<void> _showDeviceListPopup() async {
    _bluetooth.cancelDiscovery(); // Cancel any ongoing discovery

    List<BluetoothDevice> devices = [];

    try {
      devices = await _bluetooth.getBondedDevices();
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
      await _connectToDevice(selectedDevice);
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(device.address);
      print("Connected to ${device.name}");

      // Start listening for incoming data
      connection.input?.listen(
        (Uint8List data) {
          String receivedData = utf8.decode(data);
          print("Received data: $receivedData");

          setState(() {
            _nitro = _getJson(receivedData, "nitro");
            _pos = _getJson(receivedData, "pos");
            _pota = _getJson(receivedData, "pota");
            _ph = _getJson(receivedData, "ph");

            // Add received data to corresponding lists
            nitrogenData.add(_nitro);
            phosphorusData.add(_pos);
            potassiumData.add(_pota);
            phData.add(_ph);
          });
        },
        onDone: () {
          print("Disconnected remotely!");
          _disconnectFromDevice();
        },
        onError: (error) {
          print("Error receiving data: $error");
        },
      );

      setState(() {
        _connected = true;
        _connection = connection;
        _connectedDevice = device;
      });
    } catch (ex) {
      print("Error connecting to device: $ex");
    }
  }

  void _disconnectFromDevice() {
    if (_connection != null) {
      _connection.finish();
      setState(() {
        _connected = false;
      });
    }
  }

  void _sendData({required String data}) {
    if (_connection != null) {
      data = "$data\n";
      _connection.output.add(Uint8List.fromList(data.codeUnits));
      _connection.output.allSent.then((_) {
        print("Data sent successfully");
      });
    }
  }

  String _getJson(String data, String name) {
    try {
      Map<String, dynamic> jsonData = jsonDecode(data);
      String value = jsonData[name];
      print(value);
      return value;
    } on FormatException catch (e) {
      print("Invalid JSON string. $e");
    }
    return '-';
  }
}
