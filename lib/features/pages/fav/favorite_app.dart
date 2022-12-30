import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm_flutter/features/controller/favorite.dart';
import 'package:provider_with_mvvm_flutter/features/pages/fav/next_page.dart';

class Favouriteapp extends StatefulWidget {
  const Favouriteapp({super.key});

  @override
  State<Favouriteapp> createState() => _FavouriteappState();
}

class _FavouriteappState extends State<Favouriteapp> {
  List<int> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    print("bild");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favorite",
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouritPage()));
              },
              child: Icon(Icons.favorite_outline))
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Consumer<AppFavorite>(builder: (context, value, child) {
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
          }),
    );
  }
}
