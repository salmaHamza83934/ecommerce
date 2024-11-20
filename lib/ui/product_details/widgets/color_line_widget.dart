import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorLineWidget extends StatefulWidget {
  const ColorLineWidget({super.key});


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
        const Text('Color'),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
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
                      child:selectedColor==index?const Icon(Icons.check,color: Colors.white,):const SizedBox()
                  ));
            },itemCount: 5,
          ),
        ),
      ],
    );
  }
}
