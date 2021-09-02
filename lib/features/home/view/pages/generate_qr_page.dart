import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/home/view/controllers/home_controller.dart';

class GenerateQrPage extends GetView<HomeController> {
  const GenerateQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PeajeColors.white100,
        elevation: 0,
        leading: Padding(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              top: kDefaultPadding,
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: kiconSize / 1.5,
              ),
            )),
      ),
      backgroundColor: PeajeColors.white100,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 12,
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                color: PeajeColors.black,
                child: Container(
                  decoration: BoxDecoration(
                    color: PeajeColors.black,
                    image: DecorationImage(
                        image: Image.asset('assets/illustrations/qr_code.png')
                            .image),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Mostrar el código Qr',
              style: Get.textTheme.bodyText1,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Al momento de llegar al peaje, muestra este código qr a la persona que se encuentre en la cabina',
              style: Get.textTheme.bodyText2!.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 3,
              child: YellowButton(
                onPressed: () {
                  if (controller.cityState.value == CityState.Portoviejo) {
                    Get.back();
                    controller.journeyState.value = JourneyState.End;
                  } else {
                    Get.back();
                    controller.journeyState.value = JourneyState.Start;
                  }
                },
                text: 'Ya mostré el código qr',
              ),
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
