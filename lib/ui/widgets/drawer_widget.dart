import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vz_app/interactor/cubits/favorited_phrases/favorited_phrases_cubit.dart';
import 'package:vz_app/ui/utils/app_icons.dart';
import 'package:vz_app/ui/utils/app_theme.dart';
import 'package:vz_app/ui/widgets/progress_indicator_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritedPhrasesCubit = context.read<FavoritedPhrasesCubit>();

    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Favoritos",
                style: TextStyle(
                  color: AppTheme.accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(height: 10.0),
              BlocBuilder<FavoritedPhrasesCubit, FavoritedPhrasesState>(
                builder: (context, state) {
                  if (state is FavoritedPhrasesInitial) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Favorite e salve frases para copiar no futuro.",
                          style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  } else if (state is FavoritedPhrasesLoading) {
                    return const Expanded(
                      child: Center(
                        child: ProgressIndicatorWidget(),
                      ),
                    );
                  } else if (state is FavoritedPhrasesLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.phrases.length,
                        itemBuilder: (context, items) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () => Clipboard.setData(
                                          ClipboardData(
                                            text: state.phrases.values
                                                .elementAt(items),
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          AppIcons.copy,
                                          colorFilter: const ColorFilter.mode(
                                            AppTheme.accentColor,
                                            BlendMode.srcIn,
                                          ),
                                          width: 24.0,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () => favoritedPhrasesCubit
                                            .unFavoritePhrase(
                                          key: state.phrases.keys
                                              .elementAt(items),
                                        ),
                                        child: SvgPicture.asset(
                                          AppIcons.close,
                                          colorFilter: const ColorFilter.mode(
                                            AppTheme.negativeColor,
                                            BlendMode.srcIn,
                                          ),
                                          width: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20.0),
                                  Expanded(
                                    child: Text(
                                      state.phrases.values.elementAt(items),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 2.0,
                                height: 30.0,
                                color: AppTheme.tertiaryColor,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 60.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: AppTheme.secondaryColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Alterar Tema',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        AppIcons.moon,
                        colorFilter: const ColorFilter.mode(
                          AppTheme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
