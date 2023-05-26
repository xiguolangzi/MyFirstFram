import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:my_firstfram/ab_log/log_driver.dart';

import 'login_images.dart';

// class LoginSwiper extends StatelessWidget {
//   LoginSwiper({super.key});

//   final List<String> imgs = imageUrls;
//   var logs = CustomPrinter.logging(LoginSwiper);

//   @override
//   Widget build(BuildContext context) {
//     logs.i("轮播图 -- $imgs");
//     return
//         // Container(
//         //   decoration: BoxDecoration(
//         //     color: Colors.green,
//         //   ),
//         // );

//         Swiper(
//       itemCount: imageUrls.length,
//       itemBuilder: (context, index) {
//         return Image.asset(
//           imgs[index],
//           fit: BoxFit.cover,
//         );
//       },

//       // 自动播放
//       autoplay: true,
//       // 轮播延时
//       // duration: 800,
//       // 中间大图占宽比
//       viewportFraction: 0.8,
//       // 两边图片的占比
//       scale: 0.95,
//       // 小圆点
//       pagination: const SwiperPagination(
//         // alignment: Alignment.bottomCenter,
//         // margin: EdgeInsets.all(32),
//         builder: DotSwiperPaginationBuilder(
//           color: Colors.black,
//           activeColor: Colors.red,
//           size: 15,
//           activeSize: 20,
//           space: 10,
//         ),
//       ),
//       // 左右导航
//       // control: const SwiperControl(
//       //   color: Colors.red,
//       //   size: 50,
//       //   padding: EdgeInsets.all(10),
//       // ),
//     );
//   }
// }

class LoginSwiper extends StatefulWidget {
  const LoginSwiper({super.key});

  @override
  State<LoginSwiper> createState() => _LoginSwiperState();
}

class _LoginSwiperState extends State<LoginSwiper> {
  final List<String> imgs = imageUrls;
  var logs = CustomPrinter.logging(LoginSwiper);

  @override
  Widget build(BuildContext context) {
    logs.i("轮播图 -- $imgs");

    return Swiper(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Image.asset(
          imgs[index],
          fit: BoxFit.cover,
        );
      },

      // 自动播放
      autoplay: true,
      // 轮播延时
      // duration: 800,
      // 中间大图占宽比
      viewportFraction: 0.8,
      // 两边图片的占比
      scale: 0.95,
      // 小圆点
      pagination: const SwiperPagination(
        // alignment: Alignment.bottomCenter,
        // margin: EdgeInsets.all(32),
        builder: DotSwiperPaginationBuilder(
          color: Colors.black,
          activeColor: Colors.red,
          size: 15,
          activeSize: 20,
          space: 10,
        ),
      ),
      // 左右导航
      // control: const SwiperControl(
      //   color: Colors.red,
      //   size: 50,
      //   padding: EdgeInsets.all(10),
      // ),
    );
  }
}
