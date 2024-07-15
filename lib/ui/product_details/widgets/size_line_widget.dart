import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeLineWidget extends StatefulWidget {


  @override
  State<SizeLineWidget> createState() => _SizeLineWidgetState();
}

class _SizeLineWidgetState extends State<SizeLineWidget> {
  List<String> sizes=['38','39','40','41','42'];
  int selectedSize=0;
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size'),
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
                      selectedSize=index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: selectedSize==index?theme.primaryColor:Colors.white,
                    child: Text(
                      sizes[index],
                      style: TextStyle(color: selectedSize==index?Colors.white:theme.primaryColor),
                    ),
                  ));
            },itemCount: 5,
          ),
        ),
      ],
    );
  }
}
