import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:stacked/stacked.dart';
import 'package:template/domain/di/user_dependency.dart';
import 'package:template/gen/colors.gen.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';
import 'package:template/presentation/screens/dashboard/details/dashboard_details_vm.dart';
import 'package:template/presentation/theme/app_typography.dart';
import 'package:template/presentation/widgets/app_icon_button.dart';

class DashboardDetailsView extends StatelessWidget {
  const DashboardDetailsView({
    Key? key,
    @PathParam('id') required this.id,
    @QueryParam('type') this.type = 1,
  }) : super(key: key);

  final String id;
  final int type;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardDetailsViewModel>.reactive(
      viewModelBuilder: () => DashboardDetailsViewModel(
        context.user.dashboardService,
        id,
        type,
      ),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorName.appDarkBlue,
          appBar: AppBar(
            backgroundColor: ColorName.appBlue,
            leading: AppIconButton(
              onTap: () => App.router.navigate(
                const DashboardViewRoute(),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: ColorName.appTextGrey,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: viewModel.model?.previewLink ?? '',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.model?.title ?? '-',
                            style: AppTypography.sf.s18.w500.white,
                          ),
                          Text(
                            viewModel.model?.description ?? '-',
                            style: AppTypography.sf.s16.w500.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                MarkdownBody(
                  data: viewModel.model?.content ?? '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
