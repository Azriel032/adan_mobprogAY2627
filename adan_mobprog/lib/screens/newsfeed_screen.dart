import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Richmond Adan',
          postContent: 'Wazzup, Geng!',
          numOfLikes: 20,
          date: 'November 23',
          profileAssetImage: 'assets/assets/images/owl.jpg',
        ),

        NewsFeedCard(
          userName: 'National University',
          postContent: 'Stream Closer by: Gehlee!',
          numOfLikes: 50,
          hasImage: true,
          date: 'December 2',
          profileAssetImage: 'assets/assets/images/owl.jpg',
          assetImage: 'assets/assets/images/NUCCITLogo_Black.png',
        ),
      ],
    );
  }
}