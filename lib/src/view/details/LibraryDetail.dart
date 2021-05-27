import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/utils/TextUtility.dart';
import 'package:flutter_ecommerce_app/src/view/Bookslkist/books.dart';
import 'package:flutter_ecommerce_app/src/view/products/models/Product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = (screenSize.height) / 2;
    //var screenWidth = (screenSize.width) / 2;

    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          // container for the image of the product
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: product.color,
            child: Image.asset(
              product.image,
              alignment: Alignment.center,
              height: screenHeight - 100,
            ),
          ),

          // provides vertical space of 10 pxl
          SizedBox(height: 10),

          // container for the price & detail contents of the product
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                // buildRowPriceRating(),
                SizedBox(height: 10),
                Text(product.title, style: largeText),
                SizedBox(height: 10),
                Text(product.description, style: normalText),
                SizedBox(height: 20),

                Center(
                  child: buildAddToCartButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RaisedButton buildAddToCartButton(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Books(product.title))),
      },
      color: product.color,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Check Books",
          style: GoogleFonts.lato(fontSize: 15),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: product.color,
      title: Text(
        product.title,
        style: GoogleFonts.lato(fontSize: 22),
      ),
      centerTitle: true,
    );
  }
}
