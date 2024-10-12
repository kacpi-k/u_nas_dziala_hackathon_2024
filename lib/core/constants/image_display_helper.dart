import 'package:u_nas_dziala_hackathon_2024/core/constants/app_url.dart';

class ImageDisplayHelper {
  static String generateProductImageURL(String title) {
    return AppUrl.courseImage + title + AppUrl.alt;
  }
}