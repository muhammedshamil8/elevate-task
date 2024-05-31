import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String location;
  final String type;
  final String description;
  final List<String> imageUrls;
  final String username;
  final String name;
  final String title;
  final String time;

  const PostCard({
    super.key,
    this.location = '',
    this.name = '',
    this.title = '',
    this.description = '',
    this.time = '',
    required this.username,
    required this.type,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header location

          // Condition-based type UI
          if (type == 'Guide')
            _buildGuideUI(
                imageUrls, username, name, title, location, description)
          else if (type == 'Post')
            _buildPostUI(imageUrls, description, username, location, time)
          else
            _buildDefaultUI(imageUrls, description),
        ],
      ),
    );
  }

  //  Guide-specific UI elements

  Widget _buildGuideUI(List<String> imageUrls, String username,
      [String? name, String? title, String? location, String? description]) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              imageUrls[0],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(228, 203, 245, 227),
                      ),
                      child: Text(
                        '$name',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 5, 156, 98),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title ?? '',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    if (description!.isNotEmpty)
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[200]),
                      ),
                    if (location!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 15,
                              color: Color.fromARGB(255, 51, 201, 143)),
                          const SizedBox(width: 2),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 10,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/200'),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          username,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(54, 33, 126, 133),
                            minimumSize: const Size(8, 22),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 1, 194, 162),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0), // Adjust padding
                          ),
                          child: const Text('Follow',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 5, 175, 161))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

  // Post-specific UI elements

  Widget _buildPostUI(
    List<String> imageUrls,
    String description,
    String username, [
    String? location,
    String? time,
  ]) {
    return Column(
      children: [
        if (location!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.location_on,
                    color: Color.fromARGB(255, 51, 201, 143)),
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
        // Post-specific UI elements
        _buildImageLayout(imageUrls),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Faizy Faz',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text('$time',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(5, 25),
                              side: const BorderSide(
                                  color: Colors.green, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 0), // Adjust padding
                            ),
                            child: const Text('Follow',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.green)),
                          )
                        ],
                      ),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Divider(thickness: 1, color: Color.fromARGB(255, 236, 234, 234))
      ],
    );
  }

  //  Image layout based on the number of images

  Widget _buildImageLayout(List<String> imageUrls) {
    if (imageUrls.isEmpty) {
      return Container(); // Return an empty container if no images are provided
    } else if (imageUrls.length == 1) {
      // If only one image, return it taking full width
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imageUrls[0],
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    } else if (imageUrls.length == 2) {
      // If two images, split the width equally
      return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  imageUrls[0],
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Expanded(
                child: Image.asset(
                  imageUrls[1],
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ],
          ));
    } else {
      // If more than two images, split the width equally and show the first two images
      return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 300, // Set a fixed height for the entire layout
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    imageUrls[0],
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          imageUrls[1],
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Image.asset(
                          imageUrls[2],
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    }
  }
}
