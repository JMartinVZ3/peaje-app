part of 'widgets.dart';

/// Marcador manual de la pagina de mapa
class MapMarker extends StatelessWidget {
  /// Constructor del widget
  const MapMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    /// Importamos el controlador de la ubicacion
    final LocationController locationController =
        Get.find<LocationController>();

    return Stack(
      children: [
        Positioned(
          top: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: kiconSize / 1.5,
                    ))
              ],
            ),
          ),
        ),
        Obx(
          () {
            switch (controller.cityState.value) {
              case CityState.Portoviejo:
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(
                    () => AnimatedContainer(
                      height: locationController.locationChosen.value
                          ? MediaQuery.of(context).size.height / 1.5
                          : MediaQuery.of(context).size.height / 3,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: PeajeColors.darkGrey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius * 3),
                            topRight: Radius.circular(kBorderRadius * 3),
                          )),
                      child: locationController.locationChosen.value
                          ? Column(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  'Se ha marcado este lugar',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Como tu punto de llegada',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Expanded(
                                  flex: 14,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Image.asset(
                                                  'assets/illustrations/artboard1.png')
                                              .image),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: YellowButton(
                                    onPressed: () {
                                      controller.journeyState.value =
                                          JourneyState.Start;
                                      controller.cityState.value =
                                          CityState.Portoviejo;
                                      Get.back();
                                      print(locationController.location.value);
                                      locationController.locationChosen.value =
                                          false;
                                    },
                                    text: 'Continuar',
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  'Deseas marcar',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Este lugar',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Como tu punto de llegada?',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: YellowButton(
                                    onPressed: () {
                                      print(locationController.location.value);
                                      //TODO crear funcion que guarde la localizacion en el storage
                                      locationController.locationChosen.value =
                                          true;
                                    },
                                    text: 'Marcar Ubicación',
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                );

              case CityState.Guayaquil:
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(
                    () => AnimatedContainer(
                      height: locationController.locationChosen.value
                          ? MediaQuery.of(context).size.height / 1.5
                          : MediaQuery.of(context).size.height / 3,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: PeajeColors.darkGrey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius * 3),
                            topRight: Radius.circular(kBorderRadius * 3),
                          )),
                      child: locationController.locationChosen.value
                          ? Column(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  'Se ha marcado este lugar',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Como tu punto de Salida',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Expanded(
                                  flex: 14,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Image.asset(
                                                  'assets/illustrations/artboard1.png')
                                              .image),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: YellowButton(
                                    onPressed: () {
                                      controller.journeyState.value =
                                          JourneyState.Qr;

                                      Get.back();
                                      locationController.locationChosen.value =
                                          false;
                                    },
                                    text: 'Continuar',
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  'Deseas marcar',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Este lugar',
                                  style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  'Como tu punto de salida?',
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: YellowButton(
                                    onPressed: () {
                                      print(locationController.location.value);
                                      //TODO crear funcion que guarde la localizacion en el storage
                                      locationController.locationChosen.value =
                                          true;
                                    },
                                    text: 'Marcar Ubicación',
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}
