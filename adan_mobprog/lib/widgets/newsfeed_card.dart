
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;

  // Image variables
  final String? imageUrl;
  final String? profileImageUrl;
  final String? assetImage;
  final String? profileAssetImage;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imageUrl,
    this.profileImageUrl,
    this.assetImage,
    this.profileAssetImage,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  // Like functionality
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.w),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // USER PROFILE AND INFORMATION
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade300,

                  backgroundImage:
                      widget.profileAssetImage != null
                          ? AssetImage(
                              widget.profileAssetImage!,
                            )
                          : widget.profileImageUrl != null
                              ? NetworkImage(
                                  widget.profileImageUrl!,
                                )
                              : null,

                  child: widget.profileAssetImage == null &&
                          widget.profileImageUrl == null
                      ? const Icon(
                          Icons.person,
                          color: Colors.black,
                        )
                      : null,
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                      Row(
                        children: [
                          CustomText(
                            text: widget.date,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),

                          SizedBox(width: 5.w),

                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: 15.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ],
            ),

            SizedBox(height: 10.h),

            // POST CONTENT
            CustomText(
              text: widget.postContent,
              fontSize: 13.sp,
              color: Colors.black,
            ),

            // POST IMAGE
            if (widget.hasImage) ...[
              SizedBox(height: 10.h),

              SizedBox(
                width: double.infinity,
                height: 250.h,

                child: widget.assetImage != null
                    ? Image.asset(
                        widget.assetImage!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 40,
                            ),
                          );
                        },
                      )
                    : widget.imageUrl != null
                        ? Image.network(
                            widget.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Placeholder();
                            },
                          )
                        : const Placeholder(),
              ),
            ],

            SizedBox(height: 10.h),

            // LIKE COUNT
            Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: FB_DARK_PRIMARY,
                  size: 18.sp,
                ),

                SizedBox(width: 5.w),

                CustomText(
                  text: likes.toString(),
                  fontSize: 12.sp,
                  color: FB_DARK_PRIMARY,
                ),
              ],
            ),

            const Divider(),

            // LIKE, COMMENT AND SHARE BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // LIKE BUTTON - FUNCTIONAL
                TextButton.icon(
                  onPressed: toggleLike,

                  icon: Icon(
                    isLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_alt_outlined,
                    color: isLiked
                        ? FB_PRIMARY
                        : FB_DARK_PRIMARY,
                  ),

                  label: Text(
                    'Like',
                    style: TextStyle(
                      color: isLiked
                          ? FB_PRIMARY
                          : FB_DARK_PRIMARY,
                    ),
                  ),
                ),

                // COMMENT BUTTON - CLICKABLE ONLY
                TextButton.icon(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.comment_outlined,
                    color: FB_DARK_PRIMARY,
                  ),

                  label: const Text(
                    'Comment',
                    style: TextStyle(
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                ),

                // SHARE BUTTON - CLICKABLE ONLY
                TextButton.icon(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.share_outlined,
                    color: FB_DARK_PRIMARY,
                  ),

                  label: const Text(
                    'Share',
                    style: TextStyle(
                      color: FB_DARK_PRIMARY,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
