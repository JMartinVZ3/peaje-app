part of 'widgets.dart';

class YellowButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool active;

  const YellowButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kButtonHeight,
      decoration: BoxDecoration(
          color: this.active
              ? PeajeColors.yellow
              : PeajeColors.yellow.withOpacity(0.6),
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 10),
                blurRadius: 20)
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: this.active ? this.onPressed : null,
            child: Center(
              child: Container(
                width: double.infinity,
                height: kButtonHeight,
                child: Center(
                  child: Text(this.text,
                      style: TextStyle(
                        color: PeajeColors.black,
                        fontSize: kheader4FontSize,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )),
      ),
    );
  }
}
