// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_this, avoid_print, prefer_const_literals_to_create_immutables, file_names, prefer_typing_uninitialized_variables

import 'package:e_commerce/Controller/JsonData/GET.dart';
import 'package:e_commerce/Controller/Provider.dart';
import 'package:e_commerce/Model/Products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import 'CheckOut/Checkout.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var num = TextEditingController();
  var nnum = "0";
  @override
  void initState() {
    num.text = nnum;
    super.initState();
  }

  @override
  void dispose() {
    num.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Cart",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        body: Consumer<TextFeild>(
          builder: (BuildContext context, value, Widget? child) {
            return (value.cartProductModel!.data!.cartItems!.isNotEmpty)
                ? ListView(
                    children: [
                      SizedBox(
                        height: 555,
                        child: ListView.builder(
                          itemCount:
                              value.cartProductModel!.data!.cartItems!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListItem(
                              product: value.cartProductModel!.data!.cartItems![index].product!,
                              quantity: value.cartProductModel!.data!.cartItems![index].quantity!.toString(),
                              id: value.cartProductModel!.data!.cartItems![index].id!.toString(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: FutureBuilder(
                          future: GetTotal(context),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.1)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Colors.white,
                                    shadowColor: Colors.black,
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "PRICE",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: SuvaGrey),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                    "\$${(snapshot.data == null) ? "Loading...." : snapshot.data}",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: primarycolor,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                          MaterialButton(
                                            height: 50,
                                            minWidth: 150,
                                            onPressed: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder:
                                                      (BuildContext context) {
                                                return CheckOut();
                                              }));
                                            },
                                            child: Text(
                                              "Check Out",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                            color: primarycolor,
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(child: Text("No Carts" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),));
          },
        ));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.product,
    required this.quantity,
    required this.id,
  }) : super(key: key);

  final Product product;
  final String quantity;
  final String id;

  // final int index;

  @override
  State<ListItem> createState() => _ListItemState();
}
class _ListItemState extends State<ListItem> {
  var num = TextEditingController();
  var nnum = "0";
  @override
  void initState() {
    num.text = nnum;
    super.initState();
  }

  @override
  void dispose() {
    num.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      shadowColor: Colors.green,
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: ClipRRect(
              child: Image(
                image: NetworkImage(
                  "${widget.product.image}",
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "${widget.product.name}",
                  style: TextStyle(fontSize: 15),
                  maxLines: 1,
                ),
              ),
              Text(
                '  \$${widget.product.price}',
                style:
                    TextStyle(fontSize: FontTitlecategory, color: primarycolor),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 43,
                    height: 28,
                    child: Consumer<TextFeild>(
                      builder: (BuildContext context, value, Widget? child) {
                        return TextField(
                          controller: num,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                    ),
                  ),
                  Consumer<TextFeild>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Total= ${widget.quantity}",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  ),
                  Consumer<TextFeild>(
                    builder: (BuildContext context, value, Widget? child) {
                      return IconButton(
                          color: Colors.green,
                          onPressed: () async {
                              print(widget.id);
                             await  value.Quantity(widget.id, num.text);
                          },
                          icon: Icon(Icons.check_circle));
                    },
                  ),
                  Consumer<TextFeild>(
                    builder: (BuildContext context, value, Widget? child) {
                      return IconButton(
                          onPressed: () async {
                              await value.DelCart( widget.id);
                          },
                          icon: Icon(Icons.delete_outline_rounded));
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}