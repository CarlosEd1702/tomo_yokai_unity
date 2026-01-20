import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_2/flutter_unity_widget_2.dart';

class UnityTestingWrapper extends StatefulWidget {
  
  State<UnityTestingWrapper> createState() => UnityTestingState();
}

class UnityTestingState extends State<UnityTestingWrapper> {
  UnityWidgetController? controller;
  double sliderValue = 0.0;

  void initState() {
    super.initState();
  }

  Widget build(context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Unity Test Page"),
        ),
        body: 
          Card(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget> [
                UnityWidget(onUnityCreated: createdUnityWidget,),
                Positioned(bottom: 20, left: 20, right: 20,
                child:Card(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top:20),
                      child: Text("Adjust Cube Rotation Speed"),
                      )
                    ]
                  ),),),
                  Slider(
                    onChanged: (value){
                      setState(() {
                        sliderValue = value;
                      });
                      setRotationSpeed(value.toString());  
                    },
                    value: sliderValue,
                    min: 0,
                    max: 30,  
                )
              ],
            ),
          )
        ),
      );
  }

  void createdUnityWidget(UnityWidgetController controller)
  {
    this.controller = controller;
  }

  void setRotationSpeed(String speed)
  { 
    controller?.postMessage('Cube','SetRotationSpeed', speed);
  }
}
