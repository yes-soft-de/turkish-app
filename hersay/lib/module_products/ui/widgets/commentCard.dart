import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';

import 'package:hersay/utils/project_colors/project_colors.dart';

class CommentCard extends StatelessWidget {
  final String userImage;
  final String userName;
  final String commentText;
  final String date;
  const CommentCard({
    Key key,
    this.userImage,
    this.userName,
    this.commentText,
    this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.BACKGROUND_COLOR,
          borderRadius: BorderRadius.circular(25),
        ),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('$userImage'),
                    ),
                  ),
                  Container(
                    width: 5,
                  ),
                  Text('$userName'),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16),
              child: Text('$commentText'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16),
              child: Text(
                '${S.of(context).date} : $date',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
