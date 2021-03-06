import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/features/home/view/controllers/home_controller.dart';
import 'package:peaje_client/features/home/view/pages/account_page.dart';
import 'package:peaje_client/features/home/view/pages/end_journey_page.dart';
import 'package:peaje_client/features/home/view/pages/qr_journey_page.dart';
import 'package:peaje_client/features/home/view/pages/start_journey_page.dart';
import 'package:peaje_client/features/home/view/widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(
        controller: controller,
      ),
      bottomNavigationBar: _Navigation(controller: controller),
      floatingActionButton: GestureDetector(
        onTap: () {
          appFlowDialog(controller: controller);
        },
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: PeajeColors.yellow,
          ),
          child: Obx(() {
            switch (controller.journeyState.value) {
              case JourneyState.Start:
                return Icon(
                  Icons.play_arrow_rounded,
                  size: kiconSize,
                  color: PeajeColors.darkGrey,
                );
              case JourneyState.Qr:
                return Icon(
                  Icons.qr_code,
                  size: kiconSize,
                  color: PeajeColors.darkGrey,
                );
              case JourneyState.End:
                return Icon(
                  Icons.flag_rounded,
                  size: kiconSize,
                  color: PeajeColors.darkGrey,
                );

              default:
                return Icon(
                  Icons.play_arrow_rounded,
                  size: kiconSize,
                  color: PeajeColors.darkGrey,
                );
            }
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Navigation extends StatelessWidget {
  final HomeController controller;

  const _Navigation({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
          color: PeajeColors.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kBorderRadius),
            topRight: Radius.circular(kBorderRadius),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.1,
                iconSize: kiconSize,
                icon: Obx(
                  () => Icon(
                    Icons.car_repair,
                    color: controller.pageState.value == PageState.Journey
                        ? PeajeColors.white100
                        : PeajeColors.grey,
                  ),
                ),
                onPressed: () {
                  controller.pageState.value = PageState.Journey;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                splashRadius: 0.1,
                iconSize: kiconSize,
                icon: Obx(
                  () => Icon(
                    Icons.person,
                    color: controller.pageState.value == PageState.Account
                        ? PeajeColors.white100
                        : PeajeColors.grey,
                  ),
                ),
                onPressed: () {
                  controller.pageState.value = PageState.Account;
                },
              ),
            ),
          ],
        ));
  }
}

class _Paginas extends StatelessWidget {
  final HomeController controller;

  const _Paginas({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.pageState.value) {
        case PageState.Journey:
          return Obx(() {
            switch (controller.journeyState.value) {
              case JourneyState.Start:
                return StartJourneyPage();
              case JourneyState.Qr:
                return QrJourneyPage();
              case JourneyState.End:
                return EndJourneyPage();

              default:
                return StartJourneyPage();
            }
          });

        case PageState.Account:
          return AccountPage();
        default:
          return StartJourneyPage();
      }
    });
  }
}
