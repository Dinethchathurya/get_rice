import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Center(
          child: Text(
            "Current",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 50);
                },
                itemBuilder: (BuildContext context, int index) {
                  // Retrieve data from the database for each card
                  String labelText = '';
                  String data = '';

                  switch (index) {
                    case 0:
                      labelText = 'Status';
                      data = 'Retrieve from database';
                      break;
                    case 1:
                      labelText = 'Date';
                      data = 'Retrieve from database';
                      break;
                    case 2:
                      labelText = 'Time';
                      data = 'Retrieve from database';
                      break;
                    case 3:
                      labelText = 'Recorded Data';
                      data = 'Retrieve from database';
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
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add the functionality to the elevated button.
                  },
                  child: Text('OK'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.labelText,
    required this.data,
  }) : super(key: key);

  final String labelText;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The width of the card is set to 'double.infinity' to allow the card to take the full width of it's parent container.
      width: double.infinity,
      // 'height' property is used to adjust the height of the card.
      height: 100,
      child: Card(
        child: Center(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    labelText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.expand_more),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(labelText),
                    content: Text(data),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
