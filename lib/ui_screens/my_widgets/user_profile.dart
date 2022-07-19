import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';


class UserProfile extends StatelessWidget {
  UserProfile(
      {Key? key,
        required this.name,
        required this.imagePath,
        required this.flagPath,
        required this.isProfile,
        required this.index,
        this.isShowIndex = true,
        this.indexColor = Colors.black,
        required this.onTap})
      : super(key: key);

  final String name, imagePath, flagPath;
  final bool isProfile;
  bool isShowIndex;
  final int index;
  final Function() onTap;
  Color indexColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width * .45,
        // color: Colors.grey,
        child: Row(
          children: [
            isShowIndex
                ? Text(
              (index + 1).toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: indexColor),
            )
                : Container(),
            const SizedBox(width: 8),
            Column(
              children: [
                isProfile
                    ? SizedBox(
                  // color: Colors.lightGreenAccent,
                  height: 80,
                  width: 130,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                imagePath,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 4,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                width: 1.5, color: Colors.white60),
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                flagPath,
                                // 'assets/icons_png/us_flag.png'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : Icon(
                  Icons.account_circle,
                  color: Colors.black.withOpacity(0.6),
                  size: 75,
                ),
                SizedBox(
                  // color: Colors.orange,
                  width: Get.width * .25,
                  height: 30,
                  child: Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
