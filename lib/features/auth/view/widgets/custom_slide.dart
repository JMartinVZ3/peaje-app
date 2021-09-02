part of 'widgets.dart';

class CustomSlide extends StatelessWidget {
  final String title;
  final String description;
  final Widget widget;
  const CustomSlide({
    Key? key,
    required this.widget,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: widget,
          ),
          Text(
            this.title,
            style: Get.theme.textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            this.description,
            style: Get.theme.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
        ],
      ),
    );
  }
}
