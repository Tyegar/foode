import 'package:flutter/material.dart';
import 'package:foode/components/my_receipt.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../services/database/firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get acess to db
  FirestoreService db = FirestoreService();
  
  @override
  void initState() {
    super.initState();
    //if we get this page , submit the order to db
    String receipt = context.read<Restaurant>().displaCartReceipt();
    db.saveOrderToDatabase(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }

  //custom bottom nav bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            //profile pic
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                "Driver",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              //message button
              Container(
                //profile pic
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              // call button
              Container(
                //profile pic
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
