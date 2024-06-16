import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(

        title: Text("This is my task"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description will be here"),
            Text("Date: 12/12/24",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Chip(label:
                Text("New"),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),),

                ButtonBar(

                  children: [
                    IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
                  ],
                )
              ],
            )

          ],
        ),


      ),
    );
  }
}