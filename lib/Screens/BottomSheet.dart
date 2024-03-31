import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                SizedBox(
                height: 400,
                  child: ListView.builder(
                    itemCount: 10, // Replace with your desired item count
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                        onTap: () {
                          // Add your onTap logic here
                        },
                      );
                    },
                  ),
              ),
                
               ],
              );
            },
          );
        },
          child: Text(
            "Click"
          ),
        ),
      ),
    );
  }
}
