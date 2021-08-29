part of 'widgets.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    required this.slides,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (SlideshowController controller) {
      controller.colorPrimario = this.colorPrimario;
      controller.colorSecundario = this.colorSecundario;

      controller.bulletPrimario = this.bulletPrimario;
      controller.bulletSecundario = this.bulletSecundario;

      return _CrearEstructuraSlideshow(slides: slides);
    });
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _Slides(this.slides)),
        _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.totalSlides,
          (i) => _Dot(i),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Get.find<SlideshowController>();
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Get.find<SlideshowController>().currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(0),
        child: slide);
  }
}
