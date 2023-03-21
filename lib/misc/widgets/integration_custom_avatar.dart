import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IntegrationCustomAvatar extends StatelessWidget {
  final String? url;
  final double radius;

  const IntegrationCustomAvatar({
    super.key,
    this.url,
    this.radius = 60,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      foregroundImage: url != null
          ? CachedNetworkImageProvider(url!)
          : Image.asset("assets/img/profile_pic_fallback.png").image,
      backgroundImage: Image.asset("assets/img/profile_pic_fallback.png").image,
    );
  }
}
