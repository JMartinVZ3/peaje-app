import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/home/view/controllers/home_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';

class ChooseCityPage extends GetView<HomeController> {
  const ChooseCityPage({Key? key}) : super(key: key);

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
              flex: 1,
            ),
            Text(
              "De dónde vas a empezar tu viaje?",
              style: Get.textTheme.headline3!.copyWith(),
              textAlign: TextAlign.left,
            ),
            Obx(
              () => Expanded(
                flex:
                    controller.cityState.value == CityState.Portoviejo ? 6 : 4,
                child: GestureDetector(
                  onTap: () {
                    controller.cityState.value = CityState.Portoviejo;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              Image.asset('assets/illustrations/artboard1.png')
                                  .image),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(
                    () => Radio<CityState>(
                        activeColor: PeajeColors.yellow,
                        value: CityState.Portoviejo,
                        groupValue: controller.cityState.value,
                        onChanged: (CityState? value) {
                          controller.cityState.value = value!;
                        }),
                  ),
                  Text(
                    'Portoviejo, Ecuador',
                    style: Get.textTheme.bodyText1!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                flex:
                    controller.cityState.value != CityState.Portoviejo ? 6 : 4,
                child: GestureDetector(
                  onTap: () {
                    controller.cityState.value = CityState.Guayaquil;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              Image.asset('assets/illustrations/artboard1.png')
                                  .image),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Radio<CityState>(
                        activeColor: PeajeColors.yellow,
                        value: CityState.Guayaquil,
                        groupValue: controller.cityState.value,
                        onChanged: (CityState? value) {
                          controller.cityState.value = value!;
                        }),
                  ),
                  Text(
                    'Guayaquil, Ecuador',
                    style: Get.textTheme.bodyText1!.copyWith(fontSize: 14),
                  ),
                ],
              ),
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
                    Get.toNamed(Routes.GENERATE_QR);
                    controller.journeyState.value = JourneyState.Qr;
                  } else {
                    Get.back();
                    Get.toNamed(Routes.MARK_LOCATION);
                  }
                },
                text: 'Continuar',
              ),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
