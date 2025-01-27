import 'package:flutter/material.dart';
import 'package:foode/components/my_button.dart';
import 'package:foode/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon,bool> selectedAddons) {
    //close food page
    Navigator.pop(context);
    //format the select addon
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
      currentSelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold

        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //food price
                      Text('\$${widget.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      //food description
                      Text(
                        widget.food.description,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //addons
                      Text("Add-ons",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          )),

                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //get individual addon
                            Addon addon = widget.food.availableAddons[index];

                            //return checkbox
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                //button
                MyButton(onTap: () =>addToCart(widget.food, widget.selectedAddons),
                 text: "Add to cart"),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
        //back button
        SafeArea(
          
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(top: 8,left: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
