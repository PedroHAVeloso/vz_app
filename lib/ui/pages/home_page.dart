import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vz_app/interactor/cubits/phrases/phrases_cubit.dart';
import 'package:vz_app/ui/utils/app_colors.dart';
import 'package:vz_app/ui/utils/app_icons.dart';
import 'package:vz_app/ui/utils/app_theme.dart';
import 'package:vz_app/ui/widgets/appbar_widget.dart';
import 'package:vz_app/ui/widgets/bottom_appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
        scaffoldKey: scaffoldKey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<PhrasesCubit, PhrasesState>(
          builder: (context, state) {
            if (state is PhrasesInitial) {
              return Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Gere frases aleatórias de ",
                    style: TextStyle(
                      color: AppTheme.secondaryColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: "velha do zap",
                        style: TextStyle(
                          color: AppTheme.accentColor,
                        ),
                      ),
                      TextSpan(text: "."),
                    ],
                  ),
                ),
              );
            }
            if (state is PhrasesLoading) {
              return const Center(
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: CircularProgressIndicator(
                    color: AppColors.blue,
                    strokeWidth: 5.0,
                  ),
                ),
              );
            }
            if (state is PhrasesLoaded) {
              return Column(
                children: [
                  Expanded(
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
                                          text: state.phrases[items],
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
                                    SvgPicture.asset(
                                      AppIcons.favorite,
                                      colorFilter: const ColorFilter.mode(
                                        AppTheme.accentColor,
                                        BlendMode.srcIn,
                                      ),
                                      width: 24.0,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20.0),
                                Expanded(
                                  child: Text(
                                    state.phrases[items],
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
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
      endDrawer: const Drawer(),
    );
  }
}
