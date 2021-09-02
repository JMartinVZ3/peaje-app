part of 'widgets.dart';

void appFlowDialog({
  required HomeController controller,
}) {
  Get.dialog(Dialog(
    backgroundColor: PeajeColors.darkGrey,
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius * 2)),
    child: _Body(
      controller: controller,
    ),
  ));
}

/// Widget que contiene el cuerpo del dialog
class _Body extends StatelessWidget {
  final HomeController controller;
  const _Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() {
            switch (controller.cityState.value) {
              case CityState.Portoviejo:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: true,
                      );

                    case JourneyState.Qr:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.End:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    default:
                      return StartJourneyButton(
                        controller: controller,
                      );
                  }
                });

              case CityState.Guayaquil:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: true,
                      );

                    case JourneyState.Qr:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.End:
                      return StartJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    default:
                      return StartJourneyButton(
                        controller: controller,
                      );
                  }
                });
              default:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return StartJourneyButton(
                        controller: controller,
                      );

                    case JourneyState.Qr:
                      return StartJourneyButton(
                        controller: controller,
                      );

                    case JourneyState.End:
                      return StartJourneyButton(
                        controller: controller,
                      );

                    default:
                      return StartJourneyButton(
                        controller: controller,
                      );
                  }
                });
            }
          }),
          Divider(
            color: PeajeColors.white100,
            thickness: 0.5,
          ),
          Obx(() {
            switch (controller.cityState.value) {
              case CityState.Portoviejo:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.Qr:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: true,
                      );

                    case JourneyState.End:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: true,
                      );

                    default:
                      return GenerateQrButton(
                        controller: controller,
                      );
                  }
                });

              case CityState.Guayaquil:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.Qr:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: true,
                      );

                    case JourneyState.End:
                      return GenerateQrButton(
                        controller: controller,
                        enabled: true,
                      );

                    default:
                      return GenerateQrButton(
                        controller: controller,
                      );
                  }
                });
              default:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return GenerateQrButton(
                        controller: controller,
                      );

                    case JourneyState.Qr:
                      return GenerateQrButton(
                        controller: controller,
                      );

                    case JourneyState.End:
                      return GenerateQrButton(
                        controller: controller,
                      );

                    default:
                      return GenerateQrButton(
                        controller: controller,
                      );
                  }
                });
            }
          }),
          Divider(
            color: PeajeColors.white100,
            thickness: 0.5,
          ),
          Obx(() {
            switch (controller.cityState.value) {
              case CityState.Portoviejo:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.Qr:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.End:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: true,
                      );

                    default:
                      return EndJourneyButton(
                        controller: controller,
                      );
                  }
                });

              case CityState.Guayaquil:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: false,
                      );

                    case JourneyState.Qr:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: true,
                      );

                    case JourneyState.End:
                      return EndJourneyButton(
                        controller: controller,
                        enabled: true,
                      );

                    default:
                      return EndJourneyButton(
                        controller: controller,
                      );
                  }
                });
              default:
                return Obx(() {
                  switch (controller.journeyState.value) {
                    case JourneyState.Start:
                      return EndJourneyButton(
                        controller: controller,
                      );

                    case JourneyState.Qr:
                      return EndJourneyButton(
                        controller: controller,
                      );

                    case JourneyState.End:
                      return EndJourneyButton(
                        controller: controller,
                      );

                    default:
                      return EndJourneyButton(
                        controller: controller,
                      );
                  }
                });
            }
          }),
        ],
      ),
    );
  }
}

/// Boton para comenzar el viaje del usuario
class StartJourneyButton extends StatelessWidget {
  final HomeController controller;
  final bool enabled;
  const StartJourneyButton({
    Key? key,
    required this.controller,
    this.enabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
              /// Para cerrar el dialog
              Get.back();

              /// Para avanzar a la pagina de escoger ciudad
              Get.toNamed(Routes.CHOOSE_CITY);
              // controller.journeyState.value = JourneyState.Qr;
            }
          : () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Comenzar viaje',
            style: Get.textTheme.bodyText2!.copyWith(
              color: enabled ? Colors.white : PeajeColors.grey,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: enabled ? Colors.white : PeajeColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// Boton que genera el codigo qr que sera escaneado por el peaje
class GenerateQrButton extends StatelessWidget {
  final HomeController controller;
  final bool enabled;
  const GenerateQrButton({
    Key? key,
    required this.controller,
    this.enabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
              /// Para cerrar el dialog
              Get.back();

              /// Para viajar a la pagina de generar Qr
              Get.toNamed(Routes.GENERATE_QR);
            }
          : () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Generar Qr',
            style: Get.textTheme.bodyText2!.copyWith(
              color: enabled ? Colors.white : PeajeColors.grey,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.qr_code,
              color: enabled ? Colors.white : PeajeColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// Boton que sirve para finalizar el viaje
class EndJourneyButton extends StatelessWidget {
  final HomeController controller;
  final bool enabled;
  const EndJourneyButton({
    Key? key,
    required this.controller,
    this.enabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enabled) {
          if (controller.cityState.value == CityState.Portoviejo) {
            /// Para cerrar el dialog
            Get.back();

            /// Para validar si el usuario tiene la localizacion activa
            controller.validateLocation();
          } else {
            /// Para cerrar el dialog
            Get.back();

            /// Para viajar a la pagina de generar Qr
            Get.toNamed(Routes.GENERATE_QR);
          }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Terminar viaje',
            style: Get.textTheme.bodyText2!.copyWith(
              color: enabled ? Colors.white : PeajeColors.grey,
              fontSize: 16,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
              color: PeajeColors.darkGrey,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: Icon(
              Icons.flag_rounded,
              color: enabled ? Colors.white : PeajeColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
