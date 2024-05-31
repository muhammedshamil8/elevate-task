import 'package:flutter/material.dart';
import '../data/highlights.dart';
import '../data/posts.dart';
import '../widgets/story_highlight.dart';
import '../widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinify'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Story Highlights Section
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: highlights.map((highlight) {
                return StoryHighlight(imageUrl: highlight.imageUrl , user: highlight.user);
              }).toList(),
            ),
          ),
          // Posts Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: posts.map((post) {
              return PostCard(
                location: post.location,
                type: post.type,
                description: post.description,
                imageUrls: post.imageUrls,
                username: post.username,
                name: post.name,
                title: post.title,
                time: post.time,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
