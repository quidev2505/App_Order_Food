import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          margin: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xff3a3e3e),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "5000 đ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Đặt hàng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.viblo.asia/full/4192191e-65bd-4bcb-916b-1989cda13004.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Burger",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "hihiihihihi",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "250000 đ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 40,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))
                  ],
                )),
              ],
            )
          ],
        ));
  }
}
