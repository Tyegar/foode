import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context
    , builder: (context)=> AlertDialog(
      title: const Text("Your location"),
      content: const TextField(
        decoration: InputDecoration(hintText: "Search adress.."),
      ),
      actions: [
        // candel button

        MaterialButton(
          onPressed: ()=> Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        //save button

          MaterialButton(
          onPressed: ()=> Navigator.pop(context),
          child: const Text("Save"),
        )

      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",
          style: TextStyle(color : Theme.of(context).colorScheme.primary),),
          GestureDetector(
            onTap: () =>openLocationSearchBox(context),
            child: Row(
              children: [
                //adressT
                Text("421 Baker Street, London, UK",
                style: TextStyle(color : Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold)
                ,),
                
                //drop downlist
                Icon(
                  Icons.keyboard_arrow_down,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}