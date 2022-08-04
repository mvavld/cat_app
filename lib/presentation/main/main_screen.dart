import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/core/ui/scroll_behavior/disable_glow_effect_scroll_behavior.dart';
import 'package:cat_app/core/ui/widgets/base_bloc_state.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:cat_app/localization/app_localizations.dart';
import 'package:cat_app/navigation/app_navigator.dart';
import 'package:cat_app/navigation/navigation_action.dart';
import 'package:cat_app/navigation/navigation_type.dart';
import 'package:cat_app/presentation/main/bloc/main_bloc.dart';
import 'package:cat_app/presentation/main/widgets/breed_item.dart';
import 'package:cat_app/resources/app_colors.dart';
import 'package:cat_app/widgets/loaders/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/generated/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BaseBlocState<MainScreen, MainBloc> {
  final _pagingController = PagingController<int, BreedEntity>(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((scrolledItemsCount) {
      getBloc(context).add(PageScrolled(scrolledItemsCount));
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.appBackground.image().image,
                fit: BoxFit.cover,
              ),
            ),
            child: _buildBody(context),
          ),
        ),
      );

  Widget _buildBody(BuildContext context) => BlocListener<MainBloc, MainState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) async {
          BlocAction? action = state.action;
          if (action is NavigateAction) {
            await AppNavigator.navigate<void>(
              context: context,
              action: action,
            );
          }
          if (action is ShowNewBreeds) {
            _pagingController.appendPage(
              action.newBreeds,
              action.totalBreedsCount,
            );
          }
          if (action is ShowLastBreeds) {
            _pagingController.appendLastPage(action.lastBreeds);
          }
          if (action is RefreshBreeds) {
            _pagingController.refresh();
          }
        },
        child: ScrollConfiguration(
          behavior: const DisableGrowEffectScrollBehavior(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildTitle(),
                const SizedBox(height: 8),
                _buildBreeds(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).cats,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.onBackground,
            fontWeight: FontWeight.w800,
            fontSize: 35,
            height: 44 / 35,
          ),
        ),
      ],
    );
  }

  Widget _buildBreeds(BuildContext buildContext) => Expanded(
        child: PagedListView<int, BreedEntity>.separated(
          pagingController: _pagingController,
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          builderDelegate: PagedChildBuilderDelegate<BreedEntity>(
            firstPageErrorIndicatorBuilder: (context) => const SizedBox(),
            newPageErrorIndicatorBuilder: (context) => const SizedBox(),
            firstPageProgressIndicatorBuilder: (context) => const SizedBox(),
            newPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgress(size: 48)),
            noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
            noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
            itemBuilder: (context, breed, index) => Hero(
              tag: breed.id,
              child: BreedItem(
                onPressed: () {
                  AppNavigator.navigate<void>(
                    context: buildContext,
                    action: NavigateToBreed(
                      NavigateType.push,
                      breed: breed,
                    ),
                  );
                },
                breed: breed,
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 15,
          ),
        ),
      );
}
