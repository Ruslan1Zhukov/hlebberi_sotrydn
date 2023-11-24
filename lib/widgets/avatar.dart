import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:skeletonizer/skeletonizer.dart';
import "package:photo_view/photo_view.dart";

const double _size = 65;

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: user == null,
      child: InkWell(
        onTap: () {
          if (user == null) {
            return;
          }
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return FullScreenImageScreen(imageUrl: user!.avatarUrl);
            },
          ));
        },
        child: Hero(
          tag: user?.avatarUrl ?? "avatar",
          child: SizedBox(
            width: _size,
            height: _size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_size),
              child: (user != null)
                  ? Image.network(
                      user!.avatarUrl,
                      fit: BoxFit.cover,
                      width: _size,
                      height: _size,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Skeletonizer(
                          enabled: true,
                          child: Container(
                            width: _size,
                            height: _size,
                            color: ColorProject.white,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error_outline,
                          color: ColorProject.pink,
                        );
                      },
                    )
                  : Container(
                      width: _size,
                      height: _size,
                      color: ColorProject.white,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  const FullScreenImageScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
              child: PhotoView(
                imageProvider: NetworkImage(imageUrl),
                heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
                maxScale: PhotoViewComputedScale.covered * 3,
                minScale: PhotoViewComputedScale.contained,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    CupertinoIcons.clear,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
