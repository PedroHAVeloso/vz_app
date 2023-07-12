import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vz_app/interactor/cubits/counter/counter_cubit.dart';
import 'package:vz_app/interactor/cubits/phrases/phrases_cubit.dart';
import 'package:vz_app/ui/utils/app_icons.dart';
import 'package:vz_app/ui/utils/app_theme.dart';
import 'package:vz_app/ui/widgets/buttons/icon_filled_button_widget.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    final phrasesCubit = context.read<PhrasesCubit>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 104.0,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: AppTheme.secondaryColor,
                ),
                alignment: Alignment.center,
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state is CounterLoaded) {
                      return Text(
                        state.number.toString().padLeft(2, "0"),
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      );
                    } else {
                      return const Text("");
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            Column(
              children: [
                IconFilledButtonWidget(
                  onPressed: counterCubit.increment,
                  fillColor: AppTheme.tertiaryColor,
                  iconPath: AppIcons.add,
                  iconColor: AppTheme.primaryColor,
                ),
                const SizedBox(height: 4.0),
                IconFilledButtonWidget(
                  onPressed: counterCubit.decrement,
                  fillColor: AppTheme.tertiaryColor,
                  iconPath: AppIcons.remove,
                  iconColor: AppTheme.primaryColor,
                ),
              ],
            ),
            const SizedBox(width: 4.0),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox.expand(
                      child: OutlinedButton(
                        onPressed: phrasesCubit.clearPhrases,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          side: const BorderSide(
                            width: 4.0,
                            color: AppTheme.accentColor,
                          ),
                        ),
                        child: const Text(
                          "Limpar",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Expanded(
                    child: SizedBox.expand(
                      child: ElevatedButton(
                        onPressed: () => phrasesCubit.getPhrases(
                          number: BlocProvider.of<CounterCubit>(context).number,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text(
                          "Gerar",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
