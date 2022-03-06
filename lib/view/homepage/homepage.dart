import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/component/page_subtitle.dart';
import 'package:internative/core/services/homepage_api.dart';
import 'package:internative/core/shared/costum_shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  final api = HomepageApi();
  late Future<List> _homepageApi;
  late Future<List> _caterogyApi;
  @override
  void initState() {
    super.initState();
    _homepageApi = api.index();
    _caterogyApi = api.getCategory("620ceffecd70d74ab56d5b7f");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: Column(
        children: [
          categoriesMethod(),
          SubTitle(context, "Blog"),
          categoryMethod(),
        ],
      ),
    );
  }

  Expanded categoryMethod() {
    return Expanded(
      child: FutureBuilder<List>(
        future: _caterogyApi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data?[index]['Title'],
                            style: themeData.textTheme.bodyText1?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  SizedBox categoriesMethod() {
    return SizedBox(
      height: dynamicHeight(0.19),
      child: FutureBuilder<List>(
        future: _homepageApi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () async {
                  var id = snapshot.data?[index]['Id'];
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data?[index]['Image'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data?[index]['Title'],
                        style: themeData.textTheme.bodyText1?.copyWith(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      title: const Text("Home"),
    );
  }
}
