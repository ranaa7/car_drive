import 'package:more_2_drive/generated/assets.dart';

class onbordingContent {
  String image;
  String title;
  String discription;

  onbordingContent({required this.image, required this.title, required this.discription});
}

List<onbordingContent> contents = [
  onbordingContent(
      title: 'موجودين في اكثر ',
      image: Assets.imagesimage,
      discription: "من ٢٠ محطة في ٤ محافظات "
  ),
  onbordingContent(
      title: 'أكثر من',
      image: Assets.imagesw,
      discription: " 20 محطة في 4 محافظات"
  ),
  onbordingContent(
      title: 'احجز الآن',
      image: Assets.imagesmale,
      discription: "مع More2drive "
  ),
  onbordingContent(
      title: 'لو ده وقت صيانتك',
      image: Assets.imagesServiceNow,
      discription: " متقلقش !"
  ),
];