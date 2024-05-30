import 'package:elevate_task/models/post.dart';
import 'package:flutter/material.dart';
import '../data/highlights.dart';
import '../data/posts.dart';
import '../widgets/story_highlight.dart';
import '../widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Group posts by location
    final locationPosts = <String, List<Post>>{};
    for (final post in posts) {
      if (!locationPosts.containsKey(post.location)) {
        locationPosts[post.location] = [];
      }
      locationPosts[post.location]?.add(post);
    }
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
                return StoryHighlight(
                    imageUrl: highlight.imageUrl, user: highlight.user);
              }).toList(),
            ),
          ),
          // Posts Section
          ...locationPosts.keys.map((location) {
            return Column(
              children: [
                // Location heading
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Posts for this location
                ...locationPosts[location]!.map((post) {
                  return PostCard(
                    location: post.location,
                    type: post.type,
                    description: post.description,
                    imageUrls: post.imageUrls,
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}
