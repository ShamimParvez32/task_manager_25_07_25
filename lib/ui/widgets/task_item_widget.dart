import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key, required this.color,
  });

    final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: const Text('Title will be here'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description will ne here'),
            const Text('Date : 12/07/2025'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: color,
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}