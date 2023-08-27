

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/ShareReference/ShareReference.dart';
import 'package:shop_app/pages/auth/login.dart';

class bordingmodel {

   final String title;
    final  String image;
   final  String text;
    bordingmodel({required this.title,required this.text,required this.image});
}

class onBordingScreen extends StatefulWidget {
  const onBordingScreen({Key? key}) : super(key: key);

  @override
  State<onBordingScreen> createState() => _onBordingScreenState();
}

class _onBordingScreenState extends State<onBordingScreen> {
  List<bordingmodel> border =[
    bordingmodel(image:"assets/7.jpg",title: "Shopping",text:"faster online shop" ),
    bordingmodel(image:"assets/8.jpg",title: "Shopping",text:"faster online shop" ),
    bordingmodel(image:"assets/6.jpg",title: "Shopping",text:"faster online shop" ),
  ];
  var bordercontroller =PageController();
  bool islast =false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(
      actions: [
     TextButton(onPressed: (){
       submit(context);
     }, child: Text("SKIP"))
    ],),
        body: Column(children: [
            Expanded(
              child: PageView.builder(
                physics:BouncingScrollPhysics(),
                controller: bordercontroller ,
                onPageChanged: (index){
                  if( index == border.length-1){
                    islast =true;
                  }
                  else{islast=false;}
                },
                itemBuilder: (context, index) => defult(border[index]),
                itemCount: border.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                TabPageSelectorIndicator(
                  backgroundColor: Colors.cyanAccent,
                  borderColor: Colors.redAccent,
                  size: 20,),
                 Spacer(),
                FloatingActionButton(onPressed: (){
                  bordercontroller.nextPage(duration: Duration(milliseconds: 750), curve:Curves.bounceIn);
                 if(islast == true){  submit(context);
                 }else( bordercontroller.nextPage(duration: Duration(milliseconds: 750), curve:Curves.bounceIn)
                 );
                  // Navigator.push(context, PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) => logIn(), ));


                },child: Icon(Icons.keyboard_double_arrow_right_rounded),),
                SizedBox(height:100),
                Text(""),
              ],),
            )
          ],),
        )
      ,);
  }

  defult (bordingmodel model)=> Column(//mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset("${model?.image}",)),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text("${model?.title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),),
      SizedBox(height: 10,),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("${model?.text}",style: TextStyle(fontSize: 20),))
    ],);}

void submit(context){
  CachHelper.saveData(key:"onBording", value: true).then((value) {
    if(value == true)
    {
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => logIn(),),(route) => false, );
    }
  });
}