import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String location;
  final String type;
  final String description;
  final List<String> imageUrls;

  const PostCard({
    super.key,
    required this.location,
    required this.type,
    required this.description,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Condition-based type UI
            if (type == 'Guide')
              _buildGuideUI(imageUrls, description)
            else if (type == 'Post')
              _buildPostUI(imageUrls, description)
            else
              _buildDefaultUI(imageUrls, description),
          ],
        ),
      ),
    );
  }

  //  Guide-specific UI elements

  Widget _buildGuideUI(List<String> imageUrls, String description) {
    return Column(
      children: [
        // Guide-specific UI elements
        const Text(
          'Guide',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        _buildImageLayout(imageUrls),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }

  // Post-specific UI elements

  Widget _buildPostUI(List<String> imageUrls, String description) {
    return Column(
      children: [
        // Post-specific UI elements
        const Text(
          'Post',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        _buildImageLayout(imageUrls),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Faizy Faz',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(10, 30),
                          side: const BorderSide(color: Colors.green, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0), // Adjust padding
                        ),
                        child: const Text('Follow',
                            style:
                                TextStyle(fontSize: 12, color: Colors.green)),
                      )
                    ],
                  ),
                  const Text('Calicut, Kerala'),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              const Text('112'),
              const SizedBox(width: 8),
              const Icon(
                Icons.comment_bank_outlined,
                color: Colors.green,
              ),
              const Text('4'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }

//  Default UI elements

  Widget _buildDefaultUI(List<String> imageUrls, String description) {
    return Column(
      children: [
        // Default UI elements
        _buildImageLayout(imageUrls),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }

  //  Image layout based on the number of images

  Widget _buildImageLayout(List<String> imageUrls) {
    if (imageUrls.isEmpty) {
      return Container(); // Return an empty container if no images are provided
    } else if (imageUrls.length == 1) {
      // If only one image, return it taking full width
      return Image.asset(
        imageUrls[0],
        fit: BoxFit.cover,
      );
    } else if (imageUrls.length == 2) {
      // If two images, split the width equally
      return Row(
        children: [
          Expanded(
            child: Image.asset(
              imageUrls[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Image.asset(
              imageUrls[1],
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    } else {
      // If more than two images, split the width equally and show the first two images
      return SizedBox(
        height: 300, // Set a fixed height for the entire layout
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                imageUrls[0],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      imageUrls[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      imageUrls[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
