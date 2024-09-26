import 'package:fluuky/app/config/assets_constants.dart';

class WalkthroughPageModel {
  final String title;
  final String titleAr;
  final String description;
  final String descriptionAr;
  final String image;
  final int imageheight;
  final bool isLastPage;

  WalkthroughPageModel({
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.imageheight,
    this.isLastPage = false,
  });

  static final List<WalkthroughPageModel> pages = [
    WalkthroughPageModel(
      title: "Plant Trees with Fluuky",
      imageheight: 337,
      description:
          "In today's world, making an environmental impact can feel impossible. But what if you could contribute to a greener, more sustainable future while still indulging in the luxury items you love? At FLUUKY, we're making this a reality. Plant trees with us in just a few clicks and make a tangible difference in global reforestation efforts.\n\nPlus, you’ll have the chance to win luxury prizes along the way. It's a win-win for you and our beautiful planet. Welcome to FLUUKY—where doing good feels great!",
      titleAr: "زراعة الأشجار مع فلوكي",
      descriptionAr:
          "في عالم اليوم، قد يبدو من المستحيل تحقيق تأثير بيئي. لكن ماذا لو توفرت لك طريقة للمساهمة في مستقبل أكثر اخضرارًا واستدامةً، بينما تستمتع بالسلع الفاخرة التي تحبها؟ في فلوكي، نحول الأحلام إلى واقع. ازرع أشجار معنا في بضع نقرات وشارك في جهود إعادة التحريج العالمية.\n\nعلاوة على ذلك، ستحصل على فرصة للفوز بجوائز فاخرة طوال الرحلة. إنه فوز مزدوج لك ولكوكبنا الجميل. مرحبًا بك في فلوكي — حيث فعل الخير مصدرًا للسعادة!",
      image: AssetConstants.backgroundOneImage,
    ),
    WalkthroughPageModel(
      title: "Enter a Luxury Draw",
      imageheight: 287,
      description:
          "Enter a luxury draw, become a tree-planting advocate, and feel good knowing you’ve positively impacted our planet.\nWe think you can still enjoy the things you love while making a difference. We've curated a range of luxury prizes that you can win across many exciting draws!",
      titleAr: "اشترك في سحب فاخر",
      descriptionAr:
          "اشترك في سحب فاخر، وكن داعمًا لزراعة الأشجار، واستمتع بالشعور الرائع لأنك أحدثت تأثيرًا إيجابيًا على كوكبنا.\n\nنحن نؤمن بأنك قادر على الاستمتاع بالأشياء التي تحبها بينما تحدث فرقًا حقيقيًا. لقد قمنا بتنسيق مجموعة رائعة من الجوائز الفاخرة التي يمكنك الفوز بها عبر العديد من السحوبات المثيرة!",
      image: AssetConstants.backgroundTwoImage,
    ),
    WalkthroughPageModel(
      title: "Are You Our Next Winner?",
      imageheight: 224,
      description:
          "Every tree you plant gives you a chance to win exciting prizes. We make it easy for you to contribute to a greener future. It’s all part of the luxury of giving back!",
      titleAr: "هل ستكون الفائز القادم لدينا؟",
      descriptionAr: "كل شجرة تزرعها تمنحك فرصة للفوز بجوائز مثيرة. نحن نسهل عليك المساهمة في مستقبل أكثر اخضرارًا. هذا كله جزء من ترف العطاء!",
      image: AssetConstants.backgroundThreeImage,
    ),
    WalkthroughPageModel(
      title: "Track Your Impact",
      imageheight: 224,
      description:
          "Track your contributions and see the impact you're making. Your dashboard provides you with real-time updates on the number of trees you've planted, your draw entries, and prizes you've won.",
      titleAr: "تتبع تأثيرك",
      descriptionAr:
          "تتبع مساهماتك وشاهد التأثير الذي تُحدثه. توفر لك لوحة التحكم الخاصة بك تحديثات فورية عن عدد الأشجار التي قمت بزراعتها، ومشاركاتك في السحوبات، والجوائز التي فزت بها.",
      image: AssetConstants.backgroundFourImage,
      isLastPage: true,
    ),
  ];
}
