import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myproject_app/model/food_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'authentication/user_data_manager.dart';
import 'food_home_page_manager.dart';
import '../model/food_model.dart';
import 'widget/bottom_Container.dart';
import 'products/categories_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> _fetchUser;
  List<FoodModel> foodListHomePage = [];
  @override
  void initState() {
    super.initState();
    _fetchUser = context.read<UserDataManager>().getUserData();
  }

  Widget categoriesContainer(
      {required String image,
      required String name,
      required String nameCategories}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Categories(nameCategories: nameCategories)));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 25),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FoodHomePageManager foodHomePageManager =
        Provider.of<FoodHomePageManager>(context);
    foodHomePageManager.getFoodList();
    foodListHomePage = foodHomePageManager.getFoodListHomePage;
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      drawer: Drawer(
        child: Container(
          color: const Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                  future: _fetchUser,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.jpg'),
                              fit: BoxFit.cover),
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(
                              context.watch<UserDataManager>().image),
                        ),
                        accountName:
                            Text(context.watch<UserDataManager>().fullName),
                        accountEmail:
                            Text(context.watch<UserDataManager>().email),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  // child:
                ),
                drawerItem(name: "Profile", icon: Icons.person),
                drawerItem(name: "Cart", icon: Icons.add_shopping_cart),
                drawerItem(name: "Order", icon: Icons.shop),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                const ListTile(
                  leading: Text(
                    'Communicate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                drawerItem(name: "Change", icon: Icons.lock),
                drawerItem(name: "Logout", icon: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: FutureBuilder(
              future: _fetchUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CircleAvatar(
                    backgroundImage:
                        NetworkImage(context.watch<UserDataManager>().image),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoriesContainer(
                      image: "assets/images/1.png",
                      name: "Tất cả",
                      nameCategories: "all"),
                  categoriesContainer(
                      image: "assets/images/burger_categori.png",
                      name: "Burger",
                      nameCategories: "burger"),
                  categoriesContainer(
                      image: "assets/images/garan.png",
                      name: "Gà",
                      nameCategories: "chicken"),
                  categoriesContainer(
                      image: "assets/images/4.png",
                      name: "Pizza",
                      nameCategories: "pizza"),
                  categoriesContainer(
                      image: "assets/images/douong.png",
                      name: "Đồ uống",
                      nameCategories: "drink"),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              // height: 410,
              child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: foodListHomePage
                      .map(
                        (e) => BottomContainer(
                          foodModel: e,
                        ),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
