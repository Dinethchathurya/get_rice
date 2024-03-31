import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
          color: Colors.blue,// set the desired color here
          borderRadius: BorderRadius.circular(8)// Optional: for rounded corner
      ),
        child: TextButton(
          onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Center(
                        child:Text(
                            'Select a date',
                        style: TextStyle(color: Colors.blue),//Set text color
                        ),
                    ),
                    onTap: (){
                      //Add your logic for handling date selection
                    },
                  ),
                SizedBox(
                height: 400,
                  child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8, // Replace with your desired item count
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
              ),
                ListTile(
                  title: Center(
                      child: Text(
                          'Close',
                      style: TextStyle(color: Colors.blue),//Set text color
                      ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
               ],
                ),
              );
            },
          );
        },
          child: Text(
          "Click",
          style: TextStyle(color: Colors.white),// Set text color
          ),
        ),
    ),
      ),
    );
  }
}
