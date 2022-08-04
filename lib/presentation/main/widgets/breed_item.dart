import 'package:cat_app/entities/breed_entity.dart';
import 'package:cat_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BreedItem extends StatelessWidget {
  const BreedItem({
    required this.breed,
    this.onPressed,
  });

  final BreedEntity breed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            //border: Border.all(width: 2, color: AppColors.primary),
            boxShadow: [
              BoxShadow(
                color: AppColors.surface.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Row(
            children: [
              _buildImage(context),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildName(context),
                  const SizedBox(height: 8),
                  _buildOrigin(context),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildImage(BuildContext context) => GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              breed.image?.url ??
                  'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=11e949fc5d06576bc8b80ec192896753',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget _buildName(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                breed.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: AppColors.onBackground,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

  Widget _buildOrigin(BuildContext context) => Flexible(
        child: Text(
          breed.origin ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.onBackground.withOpacity(0.8),
          ),
          overflow: TextOverflow.clip,
        ),
      );
}
