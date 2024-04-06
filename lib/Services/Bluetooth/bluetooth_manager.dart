import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothManager{

  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  late BluetoothConnection _connection;
  bool _connected = false;
  late BluetoothDevice _connectedDevice;
  String _dataReceived = '{"nitro": "0","pos": "0","pota": "0", "ph": "0"}';

  String _nitro = "0";
  String _pos = "0";
  String _pota = "0";
  String _ph = "0";

  Future<void> isBluetoothEnabled() async {
    //super.initState();
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


  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      BluetoothConnection connection =
      await BluetoothConnection.toAddress(device.address);
      print("Connected to ${device.name}");

      // Start listening for incoming data
      connection.input?.listen(
            (Uint8List data) {
          String receivedData = utf8.decode(data);
          print("Received data: $receivedData");

            _dataReceived = receivedData;
            nitro = _getJson(receivedData, "nitro");
            pos = _getJson(receivedData, "pos");
            pota = _getJson(receivedData, "pota");
            ph = _getJson(receivedData, "ph");

        },
        onDone: () {
          print("Disconnected remotely!");
          disconnectFromDevice();
        },
        onError: (error) {
          print("Error receiving data: $error");
        },
      );
        _connected = true;
        _connection = connection;
        _connectedDevice = device;

    } catch (ex) {
      print("Error connecting to device: $ex");
    }
  }

  void disconnectFromDevice() {
    if (_connection != null) {
      _connection.finish();
        _connected = false;
    }
  }

  void sendData({required String data}) {
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

  String get nitro => _nitro;

  set nitro(String value) {
    _nitro = value;
  }

  String get pos => _pos;

  set pos(String value) {
    _pos = value;
  }

  String get pota => _pota;

  set pota(String value) {
    _pota = value;
  }

  String get ph => _ph;

  set ph(String value) {
    _ph = value;
  }
  bool get connected => _connected;
  BluetoothDevice get connectedDevice => _connectedDevice;
  FlutterBluetoothSerial get bluetooth => _bluetooth;


}