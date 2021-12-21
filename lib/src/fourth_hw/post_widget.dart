import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/src/fourth_hw/avatar_widget.dart';
import 'package:flutter_hw/src/fourth_hw/models.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget(this.post);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int _currentImageIndex = 0;

  void _updateImageIndex(int index, CarouselPageChangedReason reason) {
    setState(() => _currentImageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // User Details
        Row(
          children: <Widget>[
            AvatarWidget(
                username: widget.post.user.name,
                userImage: widget.post.user.image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(widget.post.user.name)],
            ),
            const Spacer(),
            IconButton(
              icon: const ImageIcon(AssetImage("resources/icons/more.png"),
                  size: 24),
              onPressed: () {},
            )
          ],
        ),
        GestureDetector(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[getCarouselSliderWidget(widget.post)],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  ImageIcon(AssetImage("resources/icons/heart.png"), size: 24),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/comment.png")),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/share.png")),
              onPressed: () {},
            ),
            Spacer(),
            if (widget.post.images.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.images.length,
                activePhotoIndex: _currentImageIndex,
              ),
            if (widget.post.assetImages.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.assetImages.length,
                activePhotoIndex: _currentImageIndex,
              ),
            Spacer(),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: const ImageIcon(AssetImage("resources/icons/bookmark.png")),
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    const Text('Нравится: '),
                    Text(widget.post.likedBy.length.toString()),
                  ],
                ),
              ),
              Text(
                widget.post.postedAt,
                style: const TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getCarouselSliderWidget(Post post) {
    if (widget.post.assetImages.isEmpty) {
      return CarouselSlider(
        items: widget.post.images.map((filePath) {
          return Image.file(
            File(filePath),
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: _updateImageIndex,
        ),
      );
    } else {
      return CarouselSlider(
        items: widget.post.assetImages.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: _updateImageIndex,
        ),
      );
    }
  }
}

class PhotoCarouselIndicator extends StatelessWidget {
  final int photoCount;
  final int activePhotoIndex;

  const PhotoCarouselIndicator({
    required this.photoCount,
    required this.activePhotoIndex,
  });

  Widget _buildDot({required bool isActive}) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: isActive ? 7.5 : 6.0,
        width: isActive ? 7.5 : 6.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photoCount, (i) => i)
          .map((i) => _buildDot(isActive: i == activePhotoIndex))
          .toList(),
    );
  }
}
