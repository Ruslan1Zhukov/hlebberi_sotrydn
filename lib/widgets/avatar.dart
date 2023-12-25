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
    required this.isLoading,
    required this.avatarUrl,
    required this.fio,
    this.size = _size,
  }) : super(key: key);

  final bool isLoading;
  final String? avatarUrl;
  final UserFio? fio;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return _AvatarSkeleton(size: size);
    var avatarUrl = this.avatarUrl;
    var fio = this.fio;
    if (avatarUrl == null) {
      if (fio == null) return _AvatarError(size: size);
      return _AvatarFio(fio: fio, size: size);
    }
    return _AvatarImage(avatarUrl: avatarUrl, size: size);
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({
    required this.avatarUrl,
    required this.size,
  });

  final String avatarUrl;
  final double size;

  _openFullScreenImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageScreen(imageUrl: avatarUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openFullScreenImage(context),
      child: Hero(
        tag: avatarUrl,
        child: SizedBox(
          width: size,
          height: size,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: Image.network(
              avatarUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return _AvatarSkeleton(size: size);
              },
              errorBuilder: (context, error, stackTrace) {
                return _AvatarError(size: size);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarFio extends StatelessWidget {
  const _AvatarFio({
    required this.fio,
    required this.size,
  });

  final UserFio fio;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: fio,
      child: Material(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Container(
            width: size,
            height: size,
            color: ColorProject.orange,
            child: Center(
              child: Text(
                fio.initials(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: ColorProject.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarError extends StatelessWidget {
  const _AvatarError({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const Center(
        child: Icon(Icons.error_outline, color: ColorProject.pink),
      ),
    );
  }
}

class _AvatarSkeleton extends StatelessWidget {
  const _AvatarSkeleton({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Skeletonizer(
        enabled: true,
        child: Container(
          width: size,
          height: size,
          color: ColorProject.white,
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
