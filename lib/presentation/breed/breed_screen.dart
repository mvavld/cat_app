import 'package:cat_app/core/generated/assets.gen.dart';
import 'package:cat_app/core/ui/widgets/base_bloc_state.dart';
import 'package:cat_app/navigation/app_navigator.dart';
import 'package:cat_app/navigation/navigation_action.dart';
import 'package:cat_app/presentation/breed/bloc/breed_bloc.dart';
import 'package:cat_app/presentation/main/bloc/main_bloc.dart';
import 'package:cat_app/resources/app_colors.dart';
import 'package:cat_app/widgets/app_bars/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedScreen extends StatefulWidget {
  const BreedScreen({super.key});

  @override
  State<BreedScreen> createState() => _BreedScreenState();
}

class _BreedScreenState extends BaseBlocState<BreedScreen, MainBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: _buildBody(context),
          ),
        ),
      );

  Widget _buildBody(BuildContext context) =>
      BlocListener<BreedBloc, BreedState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) async {
          final action = state.action;
          if (action is NavigateAction) {
            await AppNavigator.navigate<void>(
              context: context,
              action: action,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              Hero(
                tag: context.read<BreedBloc>().state.breed.id,
                child: _buildImage(),
              ),
              const SizedBox(height: 16),
              _buildDescription(),
              const Spacer(),
              _buildButtons(),
              const Spacer(),
            ],
          ),
        ),
      );

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final textSize = MediaQuery.of(context).textScaleFactor;
    final appBarHeight = textSize * 64;
    return DefaultAppbar(
      sizeFromHeight: appBarHeight,
      title: context.read<BreedBloc>().state.breed.name,
      onBackPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildImage() {
    return BlocBuilder<BreedBloc, BreedState>(
      buildWhen: (previous, current) =>
          previous.breed.image?.url != current.breed.image?.url,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 19,
                spreadRadius: -5,
                color: AppColors.surfaceShadow,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40), // Image border
            child: SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                state.breed.image?.url ??
                    'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=11e949fc5d06576bc8b80ec192896753',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescription() {
    return BlocBuilder<BreedBloc, BreedState>(
      buildWhen: (previous, current) =>
          previous.breed.description != current.breed.description,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                state.breed.description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.onBackground,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {},
          focusColor: Colors.black12.withOpacity(0.7),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Assets.images.like.svg(
              height: 24,
              width: 24,
            ),
          ),
        ),
        const SizedBox(width: 60),
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {},
          focusColor: Colors.black12.withOpacity(0.7),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Assets.images.dislike.svg(
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}
