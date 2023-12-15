import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   var wtController = TextEditingController();
   var ftController = TextEditingController();
   var inController = TextEditingController();
   var result ="";
   var bgColor = Colors.indigo.shade200;
   var bmi ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('your BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('BMI',style:TextStyle(fontSize: 34,fontWeight: FontWeight.w800)),

                   SizedBox(height: 21,),

                   TextField(
                     controller: wtController,
                     decoration: InputDecoration(
                       label: Text('Enter your weight (Kg)'),
                           prefixIcon:Icon(Icons.line_weight)
                     ),
                     keyboardType: TextInputType.number,
                   ),

                   SizedBox(height: 21,),

                   TextField(
                     controller: ftController,
                     decoration: InputDecoration(
                         label: Text('Enter your Height (feet)'),
                         prefixIcon:Icon(Icons.height)
                     ),
                     keyboardType: TextInputType.number,
                   ),

                   SizedBox(height: 21,),

                   TextField(
                     controller: inController,
                     decoration: InputDecoration(
                         label: Text('Enter your Height (inch)'),
                         prefixIcon:Icon(Icons.height)
                     ),
                     keyboardType: TextInputType.number,
                   ),

                   SizedBox(height: 16,),

                   ElevatedButton(onPressed: (){
                     var wt = wtController.text.toString();
                     var ft = ftController.text.toString();
                     var inch = inController.text.toString();
                     if (wt!= "" && ft!= "" && inch!=""){
                       // BMI calculation
                       var iwt = int.parse(wt);
                       var ift = int.parse(ft);
                       var iinch = int.parse(inch);

                       var tinch = (ift *12)+ iinch;

                       var tcm = tinch *2.54;
                       var tm = tcm /100;

                       var bmi = iwt/(tm*tm);
                       var msg ="";
                       if (bmi>25){
                         msg = "You are over weight!!!";
                         bgColor = Colors.orange.shade200;

                       }else if (bmi < 18){
                         msg = "You are HEalthy!!!";
                         bgColor= Colors.red.shade200;

                       }else{
                         msg = " You are Healthy!!";
                         bgColor = Colors.green.shade200;

                       }


                       setState(() {
                         result = " $msg \n Your BMI is :${bmi.toStringAsFixed(4)}";

                       });


                     } else {
                       setState(() {
                         result = "please fill all the  required blanks";

                       });
                     }
                   }, child: Text('Calculate')),
                   SizedBox(height: 11,),

                   Text('$result',style: TextStyle(fontSize: 19),),

                 ],
            ),
          ),
        ),
      )
    );
  }
}
