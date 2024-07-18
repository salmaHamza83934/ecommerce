import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorLineWidget extends StatefulWidget {

  @override
  State<ColorLineWidget> createState() => _ColorLineWidgetState();
}

class _ColorLineWidgetState extends State<ColorLineWidget> {
  int selectedColor=0;
  List<Color> colors=[Colors.brown,Colors.red,Colors.blue,Colors.green,Colors.pink];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color'),
        SizedBox(
          height: 8.h,
        ),
        Container(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedColor=index;
                    });
                  },
                  child: CircleAvatar(
                      backgroundColor: colors[index],
                      child:selectedColor==index?Icon(Icons.check,color: Colors.white,):SizedBox()
                  ));
            },itemCount: 5,
          ),
        ),
      ],
    );
  }
}
