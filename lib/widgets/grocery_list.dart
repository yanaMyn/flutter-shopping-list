import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
    required this.groceryItems,
  });

  final List<GroceryItem> groceryItems;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  
  void _addNewItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your groceries"),
        actions: [
          IconButton(
            onPressed: _addNewItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.groceryItems.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(widget.groceryItems[index].name),
          leading: Container(
            height: 24,
            width: 24,
            color: widget.groceryItems[index].category.color,
          ),
          trailing: Text(
            widget.groceryItems[index].quantity.toString(),
          ),
        ),
      ),
    );
  }
}
