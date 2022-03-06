import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/component/page_subtitle.dart';
import 'package:internative/core/shared/costum_shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.16),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      color: primaryColor,
                    ),
                    const Text(
                      "data",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SubTitle(context, "Blog"),
          Expanded(
            child: GridView.builder(
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
          ),
        ],
      ),
    );
  }
}
