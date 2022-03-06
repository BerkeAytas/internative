import 'package:flutter/material.dart';
import 'package:internative/core/shared/costum_shared.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  String appBarText = "My Favorites";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                color: whiteColor.withOpacity(0.5),
                child: Row(
                  children: const [
                    Text("data"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      title: Text(appBarText),
    );
  }
}
