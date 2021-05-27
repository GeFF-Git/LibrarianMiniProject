import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/view/products/models/Product.dart';

class Res {
  static final String IIT = "assets/images/IIT.jpg";
  static final String madras = "assets/images/madras1.jpeg";
  static final String Anna = "assets/images/anna1.jpg";
  static final String connemara = "assets/images/connemara4.jpg";
  static final String british = "assets/images/British.jpg";
  static final String logout1 = "assets/images/logout1.png";
  static final String little = "assets/images/little.jpg";

  static List<Product> fetchProducts() {
    List<Product> productList = [];
    String description =
        "Address: 45, 16, College Rd, DPI Campus, Thousand Lights West, Thousand Lights, Chennai, Tamil Nadu 600006.                                                                            TIMINGS: 9AM To 8PM                                                                                     Phone: 044 2220 1011         ";
    String description1 =
        "Address: Museum Compound, Pantheon Road, Egmore, Chennai, Tamil Nadu 600008                                                                                                        TIMINGS: 8AM To 8PM                                                                                                             Phone: 044 2819 3751";
    String description2 =
        "Address: Sharav Rd, Indian Institute Of Technology, Chennai, Tamil Nadu 600036                                                                                                  TIMINGS: 8AM To 12PM                                                                                                            Phone: 044 2257 4951";
    String description3 =
        "Address: 45, 16, College Rd, DPI Campus, Thousand Lights West, Thousand Lights, Chennai, Tamil Nadu 600006                                                                                        TIMINGS: 8AM To 12PM                                                                                          Phone: 044 2827 9666 ";
    String description4 =
        "Address: 737, Anna Salai, Chennai, Tamil Nadu 600002                                                                                           TIMINGS: 9AM To 7PM                                                                                                              Phone: 0120 456 9000";
    String description5 =
        "Address: 54 C, 3rd Street, River View Colony, Block AG, Opp. K3 Police Station, Anna Nagar, Chennai, Tamil Nadu 600040                                                               TIMINGS: 8AM To 8PM                                                                                                                Phone: 091768 81481                                         ";

    productList.add(new Product(
        color: Colors.amber[200],
        count: "3",
        description: description,
        image: Res.Anna,
        info: "",
        size: "23/56",
        tag: "",
        title: "Anna Centenary Library"));
    productList.add(new Product(
        color: Colors.lightBlue[100],
        count: "1",
        description: description1,
        image: Res.connemara,
        info: "",
        size: "43/506",
        tag: "",
        title: "Connemara Public Library"));
    productList.add(new Product(
        color: Colors.amberAccent,
        count: "1",
        description: description2,
        image: Res.IIT,
        info: "",
        size: "23/56",
        tag: "",
        title: "IIT Library"));
    productList.add(new Product(
        color: Colors.pink[100],
        count: "5",
        description: description3,
        image: Res.madras,
        info: "",
        size: "23/56",
        tag: "",
        title: "Madras Literary Society"));
    productList.add(new Product(
        color: Colors.teal[100],
        count: "5",
        description: description4,
        image: Res.british,
        info: "",
        size: "23/56",
        tag: "",
        title: "British Council Library"));
    productList.add(new Product(
        color: Colors.redAccent[100],
        count: "1",
        description: description5,
        image: Res.little,
        info: "",
        size: "23/56",
        tag: "",
        title: "Little Love Library"));
    return productList;
  }
}

class Name {
  static final putData = [
    {'lib': "Anna Centenary Library"},
    {'lib': "Connemara Public Library"},
    {'lib': "IIT Library"},
    {'lib': "Madras Literary Society"},
    {'lib': "British Council Library"},
    {'lib': "Little Love Library"}
  ];
}
