import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 25),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Widget bottonContainer(
      {required String image, required int price, required String name}) {
    return Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Text(
              "$price",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
              ],
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(Icons.sort),
        actions: const [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
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
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoriesContainer(
                    image: "assets/images/1.png", name: "Tất cả"),
                categoriesContainer(
                    image: "assets/images/2.png", name: "Burger"),
                categoriesContainer(
                    image: "assets/images/3.png", name: "Recipe"),
                categoriesContainer(
                    image: "assets/images/4.png", name: "Pizza"),
                categoriesContainer(
                    image: "assets/images/douong.png", name: "Đồ uống"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 490,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                bottonContainer(
                    image: "assets/images/1.png",
                    name: 'burger1',
                    price: 200000),
                bottonContainer(
                    image: "assets/images/1.png",
                    name: 'burger1',
                    price: 200000),
                bottonContainer(
                    image: "assets/images/1.png",
                    name: 'burger1',
                    price: 200000),
                bottonContainer(
                    image: "assets/images/1.png",
                    name: 'burger1',
                    price: 200000),
              ],
            ),
          )
        ],
      ),
    );
  }
}
