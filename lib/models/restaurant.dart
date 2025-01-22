import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foode/models/cart_item.dart';
import 'package:foode/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burger
    Food(
      name: "Classic Chessburger",
      description: "Classic burger with cheese and lettuce",
      price: 5.99,
      category: FoodCategory.burgers,
      imagePath: "lib/image/burgers/cheese_burger.png",
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description: "A tropical twist with grilled pineapple, teriyaki glaze, and a juicy patty topped with fresh lettuce and creamy mayo",
      price: 6.99,
      category: FoodCategory.burgers,
      imagePath: "lib/image/burgers/aloha_burger.png",
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Patty", price: 0.99),
      ],
    ),
    Food(
      name: "BBQ Chessburger",
      description: "Smoky and savory with tangy barbecue sauce, crispy onion rings, cheddar cheese, and a flame-grilled patty.",
      price: 8.99,
      category: FoodCategory.burgers,
      imagePath: "lib/image/burgers/bbq_burger.png",
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Beef Chessburger",
      description: "Classic perfection with a succulent beef patty, melted cheese, crisp lettuce, tomato, and our signature sauce.",
      price: 4.99,
      category: FoodCategory.burgers,
      imagePath: "lib/image/burgers/beef_burger.png",
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Vegie Chessburger",
      description: "Packed with flavor! A hearty plant-based patty, avocado, fresh veggies, and a zesty chipotle aioli.",
      price: 4.99,
      category: FoodCategory.burgers,
      imagePath: "lib/image/burgers/vege_burger.png",
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Tomato", price: 0.99),
      ],
    ),
    //salad
    Food(
      name: "Garden Salad",
      description: "A fresh medley of greens, cherry tomatoes, cucumbers, carrots, and your choice of dressing.",
      price: 3.99,
      category: FoodCategory.salads,
      imagePath: "lib/image/salads/vege_salad.png",
      availableAddons: [
        Addon(name: "Extra Carrot", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Cucumber", price: 0.99),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description: "Crisp romaine lettuce, crunchy croutons, and Parmesan tossed in a creamy Caesar dressing.",
      price: 2.99,
      category: FoodCategory.salads,
      imagePath: "lib/image/salads/cheses_salad.png",
      availableAddons: [
       Addon(name: "Extra Carrot", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Cucumber", price: 0.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "Juicy tomatoes, cucumbers, red onions, olives, and feta, drizzled with a tangy vinaigrette.",
      price: 2.99,
      category: FoodCategory.salads,
      imagePath: "lib/image/salads/cucumber_salad.png",
      availableAddons: [
        Addon(name: "Extra Carrot", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Cucumber", price: 0.99),
      ],
    ),
    Food(
      name: "Cobb Salad",
      description: "A hearty blend of greens, grilled chicken, avocado, boiled egg, crispy bacon, and blue cheese crumbles.",
      price: 5.99,
      category: FoodCategory.salads,
      imagePath: "lib/image/salads/mix-salad.png",
      availableAddons: [
       Addon(name: "Extra Carrot", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Cucumber", price: 0.99),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description: "Fresh mozzarella, vine-ripened tomatoes, and basil drizzled with balsamic reduction and olive oil.",
      price: 4.99,
      category: FoodCategory.salads,
      imagePath: "lib/image/salads/green_salad.png",
      availableAddons: [
       Addon(name: "Extra Carrot", price: 0.99),
        Addon(name: "Extra Lettuce", price: 0.99),
        Addon(name: "Extra Cucumber", price: 0.99),
      ],
    ),
    //sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries seasoned to perfection, served hot and fresh.",
      price: 5.99,
      category: FoodCategory.sides,
      imagePath: "lib/image/sides/french_fries.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Thick-cut onions coated in a crunchy batter, fried until golden brown.",
      price: 5.99,
      category: FoodCategory.sides,
      imagePath: "lib/image/sides/stir_fried_vegetables.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Vege Chilli",
      description: "Classic side dish taste as good as it look to everyone.",
      price: 5.99,
      category: FoodCategory.sides,
      imagePath: "lib/image/sides/vege_chilli.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Rice Noodles Kimchi",
      description: "Classic side dish taste as good as it look to everyone.",
      price: 5.99,
      category: FoodCategory.sides,
      imagePath: "lib/image/sides/rice_noodles_kimchi.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Portuguese Bacalhau",
      description: "Classic side dish taste as good as it look to everyone.",
      price: 5.99,
      category: FoodCategory.sides,
      imagePath: "lib/image/sides/portuguese_bacalhau.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    //desserts
    Food(
      name: "Chocolate Mousse",
      description: "Sweet and creamy, with a hint of chocolate.",
      price: 5.99,
      category: FoodCategory.desserts,
      imagePath: "lib/image/desserts/chocolate_mousse.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Cupcake",
      description: "Classic cupcake with vanilla flavor.",
      price: 5.99,
      category: FoodCategory.desserts,
      imagePath: "lib/image/desserts/cup_cake.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Raspberry Pudding",
      description: "Creamy pudding with a hint of raspberry flavor.",
      price: 5.99,
      category: FoodCategory.desserts,
      imagePath: "lib/image/desserts/raspberry_pudding.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Sliced Cake",
      description: "Classic cake sliced into pieces.",
      price: 5.99,
      category: FoodCategory.desserts,
      imagePath: "lib/image/desserts/sliced_cake.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Tiramisu",
      description: "Classic Italian dessert with layers of coffee and chocolate.",
      price: 5.99,
      category: FoodCategory.desserts,
      imagePath: "lib/image/desserts/tiramisu.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    //drinks
    Food(
      name: "Coke",
      description: "Classic coke taste as good as it look to everyone.",
      price: 1.99,
      category: FoodCategory.drinks,
      imagePath: "lib/image/drinks/coke.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Lemon drink",
      description: "Classic lemon drink taste as good as it look to everyone.",
      price: 1.99,
      category: FoodCategory.drinks,
      imagePath: "lib/image/drinks/lemon_drink.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Sweet Drink",
      description: "Classic sweet drink taste as good as it look to everyone.",
      price: 1.99,
      category: FoodCategory.drinks,
      imagePath: "lib/image/drinks/sweet_drink.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Orange Juice",
      description: "Classic burger with cheese and lettuce",
      price: 1.99,
      category: FoodCategory.drinks,
      imagePath: "lib/image/drinks/orange_juice.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
    Food(
      name: "Tropical Drink",
      description: "Refreshing and chilled, available in sweetened or unsweetened options.",
      price: 2.99,
      category: FoodCategory.drinks,
      imagePath: "lib/image/drinks/tropical_drink.png",
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 0.99),
        Addon(name: "Tomato", price: 0.99),
      ],
    ),
  ];

  /*

    GETTERS

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*

    OPERATIONS

  */

  //user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //check if food is already in cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if itrem the same
      bool isSame = item.food == food;
      //check if the list of selected addon are the same
      bool isSameAddon =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSame && isSameAddon;
    });

    if (cartItem != null) {
      //if food is already in cart, increment quantity
      cartItem.quantity++;
    } else {
      //if food is not in cart, add it
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double totalPrice = 0;
    for (CartItem cartItem in _cart) {
      totalPrice += cartItem.quantity * cartItem.food.price;
    }
    return totalPrice;
  }

  //get total num of item in cart
  int getTotalItemCart() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

    HELPERS

  */

  //generate a reciept
  String displaCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln("Date: $formattedDate");
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total: ${getTotalItemCart()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addons) => "${addons.name} (${_formatPrice((addons.price))})")
        .join(", ");
  }
}
