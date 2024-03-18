import 'package:flutter/material.dart';

class Past extends StatefulWidget {
  const Past({super.key});

  @override
  State<Past> createState() => _PastState();
}

class _PastState extends State<Past> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Center(
            child: Text(
              "Past",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.separated(
              // Represents the number of cards to be displayed.
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  // Adjusts the space between each card.
                  height: 16,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                String labelText = '';
                String data = '';

                switch (index) {
                  case 0:
                    labelText = 'Fertilizer Type';
                    data = 'Retrieve type from database';
                    break;

                  case 1:
                    labelText = 'Required Amount';
                    data = 'Retrieve amount from database';
                    break;

                  case 2:
                    labelText = 'Expected Date Of Rain';
                    data = 'Retrieve date from database';
                    break;

                  case 3:
                    labelText = 'Expected Time Of Rain';
                    data = 'Retrieve time from database';
                    break;
                }
                return ItemWidget(
                  labelText: labelText,
                  data: data,
                );
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add the functionality to the button so that when pressed, the user will be directed to the current page.
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )))
        ]));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.labelText, required this.data});

  final String labelText;
  final String data;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
