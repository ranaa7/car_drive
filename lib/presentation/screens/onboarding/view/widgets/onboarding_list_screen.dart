import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class OnBoardingContent {
  String image;
  String title;
  String discription;

  OnBoardingContent({required this.image, required this.title, required this.discription});
}

List<OnBoardingContent> contents = [

  OnBoardingContent(
      title: AppStrings.onboardingTitle1,
      image: Assets.imagesServiceNow,
      discription: AppStrings.onboardingdesc1
  ),
  OnBoardingContent(
      title: AppStrings.onboardingTitle2,
      image: Assets.imagesMaleMechanicWorkingShopCar,
      discription: AppStrings.onboardingdesc2
  ),
  OnBoardingContent(
      title: AppStrings.onboardingTitle3,
      image: Assets.imagesW,
      discription: AppStrings.onboardingdesc3
  ),
  OnBoardingContent(
      title: AppStrings.onboardingTitle4,
      image: Assets.imagesImage,
      discription: AppStrings.onboardingdesc4
  ),



];