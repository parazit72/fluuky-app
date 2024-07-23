import 'package:fluuky/app/config/assets_constants.dart';

class WalkthroughPageModel {
  final String title;
  final String description;
  final String image;
  final bool isLastPage;

  WalkthroughPageModel({
    required this.title,
    required this.description,
    required this.image,
    this.isLastPage = false,
  });

  static final List<WalkthroughPageModel> pages = [
    WalkthroughPageModel(
      title: "Plant Trees with Fluuky",
      description:
          "In today's world, making an environmental impact can feel impossible. But what if you could contribute to a greener, more sustainable future while still indulging in the luxury items you love? At Fluuky, we're making this a reality. Plant trees with us in just a few clicks and make a tangible difference in global reforestation efforts.\nPlus, you’ll have the chance to win luxury prizes along the way. It's a win-win for you and our beautiful planet. Welcome to Fluuky—where doing good feels great!",
      image: AssetConstants.backgroundOneImage,
    ),
    WalkthroughPageModel(
      title: "Enter a Luxury Draw",
      description:
          "Enter a luxury draw, become a tree-planting advocate, and feel good knowing you’ve positively impacted our planet.\nWe think you can still enjoy the things you love while making a difference. We've curated a range of luxury prizes that you can win across many exciting draws!",
      image: AssetConstants.backgroundTwoImage,
    ),
    WalkthroughPageModel(
      title: "Are You Our Next Winner?",
      description:
          "Every tree you plant gives you a chance to win exciting prizes. We make it easy for you to contribute to a greener future. It’s all part of the luxury of giving back!",
      image: AssetConstants.backgroundThreeImage,
    ),
    WalkthroughPageModel(
      title: "Track Your Impact",
      description:
          "Track your contributions and see the impact you're making. Your dashboard provides you with real-time updates on the number of trees you've planted, your draw entries, and prizes you've won.",
      image: AssetConstants.backgroundFourImage,
      isLastPage: true,
    ),
  ];
}
