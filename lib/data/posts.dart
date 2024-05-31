import '../models/post.dart';

final List<Post> posts = [
  Post(
    location: 'Calicut',
    type: 'Post',
    description: 'Very calm and peaceful place near Calicut...',
    imageUrls: ['assets/images/img1.jpg', 'assets/images/img7.jpg', 'assets/images/img3.jpg'],
    username: 'John Doe',
    time: '4: 30 PM',
  ),
  Post(
    type: 'Guide',
    name: 'Guides',
    title: 'Calicut One Day Trip',
    description: '5 destinations',
    imageUrls: ['assets/images/img3.jpg'],
    username: 'Jane Doe',
  ),
  Post(
    location: 'Trivandrum',
    type: 'Post',
    description: 'A beautiful place to visit...',
    imageUrls: ['assets/images/img1.jpg'],
    username: 'John Doe',
  ),
   Post(
    location: 'Kovalam',
    type: 'Guide',
    name: 'Trip',
    title: 'Calicut One Day Trip',
    imageUrls: ['assets/images/img2.jpg'],
    username: 'Jane Doe',
  ),
];
