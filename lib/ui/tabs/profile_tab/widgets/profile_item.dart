import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  String fieldName;
  String fieldTxt;


  ProfileItem(this.fieldName, this.fieldTxt);

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 400.w,
          height: 60.h,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Text(fieldTxt,overflow: TextOverflow.ellipsis,style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15.sp),),
              Spacer(),
              Icon(Icons.edit,color: theme.primaryColor,)
            ],
          ),
        ),
        SizedBox(height: 24.h,)
      ],
    );
  }
}
