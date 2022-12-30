import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/favorite.dart';

class FavouritPage extends StatefulWidget {
  const FavouritPage({super.key});

  @override
  State<FavouritPage> createState() => _FavouritPageState();
}

class _FavouritPageState extends State<FavouritPage> {
  List<int> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    print("bild");
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Favorite"),
        ),
        body: Consumer<AppFavorite>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.selectedIndex.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      if (value.selectedIndex.contains(index)) {
                        value.removeItem(index);
                      } else {
                        value.addItem(index);
                      }
                    },
                    title: Text("index $index"),
                    trailing: value.selectedIndex.contains(index)
                        ? const Icon(
                            Icons.favorite,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                          ));
              });
        }));
  }
}
