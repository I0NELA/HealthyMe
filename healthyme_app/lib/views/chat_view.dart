import 'package:flutter/cupertino.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [const CupertinoSliverNavigationBar(largeTitle: Text('Chat'))],
      ),
    );
  }
}
