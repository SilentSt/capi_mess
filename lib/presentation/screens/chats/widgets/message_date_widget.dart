import 'package:flutter/material.dart';
import 'package:template/presentation/utils/utils.dart';

class MessageDateWidget extends StatelessWidget {
  const MessageDateWidget({Key? key, required this.createdAt, this.updatedAt}) : super(key: key);

  final DateTime createdAt;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (updatedAt == null)
          if (Utils.isToday(createdAt.toLocal()))
            Text(
              Utils.formatDate(
                createdAt.toLocal(),
                format: 'hh:mm',
              ),
            )
          else
            Text(
              Utils.formatDate(
                createdAt.toLocal(),
              ),
            )
        else if (Utils.isToday(createdAt.toLocal()))
          Text(
            Utils.formatDate(
              updatedAt?.toLocal(),
              format: 'hh:mm',
            ),
          )
        else
          Text(
            Utils.formatDate(
              updatedAt?.toLocal(),
            ),
          ),
      ],
    );
  }
}
