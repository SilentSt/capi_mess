import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';
import 'package:template/presentation/screens/dashboard/dashboard_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(
        context.user.dashboardService,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorName.appDarkBlue,
          appBar: AppBar(
            backgroundColor: ColorName.appBlue,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'chats') {
                    App.router.navigate(ChatsViewRoute());
                  }
                },
                offset: const Offset(1, 35),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                splashRadius: 0,
                constraints: const BoxConstraints(minWidth: 145),
                color: ColorName.appBlue,
                itemBuilder: (context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                      value: 'dashboard',
                      child: Text(
                        'Дэшборд',
                        style: AppTypography.sf.s16.w500.appGrey,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'chats',
                      child: Text(
                        'Чаты',
                        style: AppTypography.sf.s16.w500.appGrey,
                      ),
                    ),
                  ];
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'CapiMessenger',
                      style: AppTypography.sf.s16.w600.white,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorName.appTextGrey,
                    )
                  ],
                ),
              ),
            ),
            leadingWidth: 300,
          ),
          body: ListView(
            children: [
              const SizedBox(height: 30),
              FlutterCarousel.builder(
                itemCount: viewModel.projects.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 8),
                  allowImplicitScrolling: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  final item = viewModel.projects[index];
                  return CupertinoButton(
                    onPressed: () => App.router.navigate(
                      DashboardDetailsViewRoute(
                        id: item.id!,
                        type: 1,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: item.previewLink!,
                          fit: MediaQuery.of(context).size.width > 450
                              ? BoxFit.fitWidth
                              : BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: viewModel.news
                    .map(
                      (e) => CupertinoButton(
                        onPressed: () => App.router.navigate(
                          DashboardDetailsViewRoute(
                            id: e.id!,
                            type: 2,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        child: SizedBox(
                          width: 400,
                          height: 600,
                          child: Card(
                            color: ColorName.appBlue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (e.previewLink != null)
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                    child: CachedNetworkImage(
                                      imageUrl: e.previewLink!,
                                      fit: MediaQuery.of(context).size.width >
                                              450
                                          ? BoxFit.fitWidth
                                          : BoxFit.fitHeight,
                                    ),
                                  ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title ?? '',
                                      style: AppTypography.sf.s24.w600.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      e.description ?? '',
                                      style: AppTypography.sf.s20.w600.appGrey,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
