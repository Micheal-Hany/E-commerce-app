import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Item>[].obs;

  double get totalPrice =>
      cartItems.fold(0, (total, current) => total + current.price);

  void addItem(Item item) {
    cartItems.add(item);
  }

  void removeItem(Item item) {
    cartItems.remove(item);
  }
}

class Item {
  final String name;
  final double price;

  Item(this.name, this.price);
}

class CartPageTest extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final List<Item> itemList = [
    Item("Item 1", 10.0),
    Item("Item 2", 15.0),
    Item("Item 3", 20.0),
    // Add more items as needed
  ];

  CartPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return CartItemWidget(item: item);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text(
                  'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Item item;
  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return ListTile(
      title: Text(item.name),
      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
      trailing: CounterWidget(item: item),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final Item item;
  const CounterWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            cartController.removeItem(item);
          },
        ),
        Obx(() => Text(
              cartController.cartItems
                  .where((element) => element == item)
                  .length
                  .toString(),
              style: const TextStyle(fontSize: 18),
            )),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            cartController.addItem(item);
          },
        ),
      ],
    );
  }
}
