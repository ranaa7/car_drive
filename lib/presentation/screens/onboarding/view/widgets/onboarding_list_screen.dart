import 'package:more_2_drive/generated/assets.dart';

class OnBoardingContent {
  String image;
  String title;
  String discription;

  OnBoardingContent({required this.image, required this.title, required this.discription});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'موجودين في اكثر ',
      image: Assets.imagesImage,
      discription: "من ٢٠ محطة في ٤ محافظات "
  ),
  OnBoardingContent(
      title: 'أكثر من',
      image: Assets.imagesW,
      discription: " 20 محطة في 4 محافظات"
  ),
  OnBoardingContent(
      title: 'احجز الآن',
      image: Assets.imagesMaleMechanicWorkingShopCar,
      discription: "مع More2drive "
  ),
  OnBoardingContent(
      title: 'لو ده وقت صيانتك',
      image: Assets.imagesServiceNow,
      discription: " متقلقش !"
  ),
];