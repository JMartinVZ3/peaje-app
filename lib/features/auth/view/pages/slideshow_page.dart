import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/slideshow_controller.dart';
import 'package:peaje_client/features/auth/view/widgets/widgets.dart';
import 'package:peaje_client/routes/app_pages.dart';

import '../../../../common.dart';

/// Pagina en la que se verifica si el usuario ha iniciado sesion.

class SlideshowPage extends GetView<SlideshowController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PeajeColors.white100,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 40,
                bottom: 20,
              ),
              child: Align(
                  alignment: Alignment.centerRight, child: Text('Omitir')),
            ),
            Expanded(child: MySlideshow()),
            BotonesDeInicio(),
          ],
        ));
  }
}

class MySlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 14,
      bulletSecundario: 14,
      colorPrimario: PeajeColors.black,
      colorSecundario: PeajeColors.grey,
      slides: <Widget>[
        CustomSlide(
          widget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      Image.asset('assets/illustrations/artboard1.png').image),
            ),
          ),
          title: 'Viaja a Guayaquil sin pagar peaje',
          description:
              'Esta aplicación te permite viajar de Guayaquil a Portoviejo o viceversa sin tener que pagar los \$0.50 del peaje',
        ),
        CustomSlide(
          widget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      Image.asset('assets/illustrations/artboard2.png').image),
            ),
          ),
          title: 'Para empezar',
          description:
              'Dale click al botón amarillo que se encuentra en el menú principal y selecciona comenzar viaje',
        ),
        CustomSlide(
          widget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      Image.asset('assets/illustrations/artboard3.png').image),
            ),
          ),
          title: 'Luego,',
          description: 'Activa tu ubicación y selecciona tu punto de partida',
        ),
        CustomSlide(
          widget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      Image.asset('assets/illustrations/artboard4.png').image),
            ),
          ),
          title: 'Cuando llegues al peaje',
          description:
              'Presiona el botón de generar código Qr y muestraselo a la persona que se encuentre cobrando en la cabina',
        ),
        CustomSlide(
          widget: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      Image.asset('assets/illustrations/artboard1.png').image),
            ),
          ),
          title: 'Después, cuando llegues a tu destino',
          description:
              'Vuelve a darle click al botón amarillo y selecciona terminar viaje, activa tu ubicación y valídala',
        ),
      ],
    );
  }
}

class BotonesDeInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          YellowButton(
            text: 'Siguiente',
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Made with love by Fail"),
              SizedBox(
                width: kSmallPadding / 2,
              ),
              Icon(
                Icons.favorite,
                color: PeajeColors.grey,
                size: 15,
              )
            ],
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
