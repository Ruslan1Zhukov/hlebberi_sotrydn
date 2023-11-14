import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                  )
                : Container(
                    width: _size,
                    height: _size,
                    color: ColorProject.white,
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
              child: Center(
                child: Hero(
                  tag: imageUrl,
                    child: Image.network(imageUrl),
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
                child: const Icon(CupertinoIcons.clear_circled),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
