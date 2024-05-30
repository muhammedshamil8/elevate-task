import 'package:flutter/material.dart';

class StoryHighlight extends StatelessWidget {
  final String imageUrl;
  final bool user;
  const StoryHighlight({super.key, required this.imageUrl, this.user = false});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: user
            ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage(imageUrl),
                    ),
                  ),
                  const Positioned(
                    bottom: 3,
                    right: 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 51, 201, 143),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(255, 51, 201, 143),
                      width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
              ));
  }
}
