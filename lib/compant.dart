import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget DefultTextForm({
  controller,
  onChange,
  bool validatorPostion = false,
  Textvalidator,
  prefixIcon,
  labelText,
  hintText,
  suffixIcon,
  bool lock = false,
  ontap,
  double circular = 0,
  keyboardType = TextInputType.emailAddress,
  floatingLabelAlignment = FloatingLabelAlignment.start,
}) =>
    TextFormField(
      onChanged: onChange,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          if (validatorPostion == true) {
            return '${Textvalidator}';
          } else {
            return null;
          }
        }
      },
      onTap: ontap,
      obscureText: lock,
      decoration: InputDecoration(
          floatingLabelAlignment: floatingLabelAlignment,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circular),
              borderSide: BorderSide(color: Colors.redAccent))),
    );

Widget Button({
  colorContainer = Colors.blue,
  splashColor,
  textColor = Colors.white70,
  text,
  onPressed,
  double circular = 10,
  double widthContainer = 220,
  double fontSize = 30,
}) =>
    Center(
      child: Container(
        width: widthContainer,
        decoration: BoxDecoration(
            color: colorContainer,
            borderRadius: BorderRadius.circular(circular)),
        child: MaterialButton(
          onPressed: onPressed,
          splashColor: splashColor,
          textColor: textColor,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );

Widget HomeShopDesign({
  title = "title",
  price = "200",
  oldPrice="250",
  discount="0",
  url = "url",
  favorite ,
  bool shop = false,
  onPressedIconCart,
  onPressedIconFav

}) =>
    Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image(image: NetworkImage(url),
             fit: BoxFit.fill,
             width:double.infinity,height:150 ,),
           Container(
             color: Colors.red,
             child:  Text(
               " خصم ${discount} %",
               style: TextStyle(fontSize: 15,color: Colors.white),
             ),
           ),
           Padding(
             padding:  EdgeInsets.all(4.0),
             child: Column(children: [
               Text(
                 title,
                 style: TextStyle(
                   fontSize: 15,
                 ),
                 maxLines: 2,
               ),
               SizedBox(
                 height: 10,
               ),
               Center(
                 child: Container(
                   width: 120,height: 1,
                   color: Colors.grey,
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text(
                     price,
                     style: TextStyle(fontSize: 15,color: Colors.blue),
                   ),
                   SizedBox(width: 5,),
                   Text(
                     oldPrice,
                     style: TextStyle(fontSize: 12,decoration: TextDecoration.lineThrough,color: Colors.blueGrey),
                   ),
                   IconButton(
                     onPressed: onPressedIconCart,
                     icon: (shop == false)
                         ? Icon(Icons.add_shopping_cart,
                         color: Colors.grey, size: 22)
                         : Icon(
                       Icons.shopping_cart,
                       color: Colors.green,
                       size: 22,
                     ),
                   ),
                   IconButton(
                     onPressed:onPressedIconFav ,
                     icon: (favorite)
                         ? Icon(Icons.favorite,
                         color: Colors.red, size: 22)
                         : Icon(
                       Icons.favorite_border,
                       color: Colors.red,
                       size: 22,
                     ),
                   ),
             ],)
             ],),
           ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: (shop == false)
            //           ? Icon(Icons.add_shopping_cart,
            //           color: Colors.grey, size: 25)
            //           : Icon(
            //         Icons.shopping_cart,
            //         color: Colors.green,
            //         size: 25,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: (favorite == false)
            //           ? Icon(Icons.favorite_border,
            //           color: Colors.red, size: 25)
            //           : Icon(
            //         Icons.favorite,
            //         color: Colors.red,
            //         size: 25,
            //       ),
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );


Widget FavoriteShopDesign({
  title = "title",
  price = "200",
  oldPrice="00",
  discount="0",
  url = "url",
  favorite ,
  bool shop = false,
  onPressedIconCart,
  onPressedIconFav

}) =>
    Center(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(image: NetworkImage(url),
                  fit: BoxFit.fill,
                  width:150,height:150 ,),
                Container(
                  color: Colors.red,
                  child:  Text(
                    " خصم ${discount} %",
                    style: TextStyle(fontSize: 15,color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding:  EdgeInsets.all(4.0),
                child: Column(children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 120,height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        price,
                        style: TextStyle(fontSize: 15,color: Colors.blue),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        oldPrice,
                        style: TextStyle(fontSize: 15,decoration: TextDecoration.lineThrough,color: Colors.blueGrey),
                      ),
                      IconButton(
                        onPressed:onPressedIconCart ,
                        icon: (favorite)
                            ?Icon(
                          Icons.shopping_cart,
                          color: Colors.green,size: 25,)
                            : Icon(Icons.add_shopping_cart,
                      color: Colors.red, size: 25)
                      ),
                      IconButton(
                        onPressed:onPressedIconFav ,
                        icon: (shop)
                            ? Icon(Icons.favorite,
                            color: Colors.red, size: 25)
                            : Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ],)
                ],),
              ),
            ),

          ],
        ),
      ),
    );





Widget cardNews(
        {double widthContainer = 200,
        double heightContainer = 160,
        boxShadow = Colors.red,
        colorCard = Colors.white,
        double horizontalPadding = 10,
        title = "title",
        price = "200",
        url = "url",
        double? imgWidth,
        double? imgHight,
        article}) => Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 130),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: widthContainer,
              height: heightContainer,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                        color: boxShadow.withOpacity(0.3),
                        offset: Offset(10, 10),
                        blurRadius: 20,
                        spreadRadius: 10)
                  ]),
              child: Card(
                elevation: 12,
                color: colorCard,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${article["title"].toString()}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        maxLines: 3,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text("${article["author"].toString()}",
                                    style: TextStyle(fontSize: 18))),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              article["publishedAt"].toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 110,
                bottom: 172,
                child: article["urlToImage"] == null
                    ? Icon(
                        Icons.image_not_supported_outlined,
                        size: 150,
                      )
                    : Image.network(
                        article["urlToImage"],
                        width: imgWidth,
                        height: imgHight,
                      ))
          ],
        ),
      ),
    );

  Widget view()=> Container(
        width: 230,height: 220,
        child: Column(
          children: [
            Icon(Icons.perm_contact_cal_outlined,size: 150,),
            Text("nnnnnnnghfdbsxdnnnnnsxnfxnfgxnnnnnnnghfdbsxdnnnnnsxnfxnfgxnnnnnnnghfdbsxdnnnnnsxnfxnfgx",maxLines: 2),
            Row(children: [
              Text("12500",maxLines: 1,),
              SizedBox(width: 10,),
              Text("155646",maxLines: 1),
            ],),
          ],
        ),
      );

void ShowToast({
  required String text,
  required toastStutes stutes,}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 10,
    backgroundColor: chooseColor(stutes),
    textColor: Colors.white,
    fontSize: 16.0
);
enum toastStutes {suess,error,warning}

Color chooseColor(toastStutes stutes) {

  Color color;
  switch(stutes)
  {
    case toastStutes.suess:
      color = Colors.green;
      break;
    case toastStutes.error:
      color= Colors.red;
      break;
    case toastStutes.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}


//const LOGIN = 'login';
//
// const REGISTER = 'register';
//
// const HOME = 'home';
//
// const GET_CATEGORIES = 'categories';
//
// const FAVORITES = 'favorites';
//
// const PROFILE = 'profile';
//
// const UPDATE_PROFILE = 'update-profile';
//
// const SEARCH = 'products/search';
