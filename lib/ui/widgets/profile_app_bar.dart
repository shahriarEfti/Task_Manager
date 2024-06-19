import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

import '../utility/app_colors.dart';
import 'network_cached_image.dart';

AppBar ProfileAppBar(context, [bool fromUpdateProfile =false]) {
  return AppBar(
    title: GestureDetector(
      onTap: (){
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shahriar Efti",style: TextStyle(
              color: Colors.white,
              fontSize: 16
          ),),
          Text("shahriar@gmail.com",
            style:
            TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),),

        ],
      ),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
    ],
    backgroundColor: AppColors.themeColor,
    leading:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: NetworkCachedImage(

            url: ""),

      ),
    ),
  );
}