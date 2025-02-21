// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class OnboardPage extends StatelessWidget {
//   const OnboardPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.description,
//     required this.isNetworkImage,
//   });

//   final String image;
//   final String title;
//   final String description;
//   final bool isNetworkImage;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Background Image with Blur Effect
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: isNetworkImage
//                     ? CachedNetworkImageProvider(image)
//                     : AssetImage(image) as ImageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.3),
//                   Colors.black.withOpacity(0.8),
//                 ],
//               ),
//             ),
//           ),
//         ),

//         // Onboarding Content
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               // Title
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       color: Colors.black38,
//                       offset: Offset(2, 2),
//                       blurRadius: 5,
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Description
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Text(
//                   description,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white70,
//                     height: 1.5,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image with Blur Effect
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),

        // Onboarding Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    )
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
