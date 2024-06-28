import 'package:Auto_Shop/features/home/view/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/cache_helper.dart';
import '../../../../core/utils/functions.dart';
import '../../../../generated/l10n.dart';
import '../../manager/cubits/language/language_cubit.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                S.of(context).chose_language_text,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  if (isActive == false) {
                    setState(() {
                      isActive = true;
                    });
                  }
                  CacheHelper.saveData(key: "language", value: "en");

                  LanguageCubit.get(context).languageChange(language: 'en');
                },
                child: Column(children: [
                  Divider(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).shadowColor,
                      thickness: 1),
                  Text(
                    S.of(context).english_text,
                    style: TextStyle(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).shadowColor,
                    ),
                  ),
                  Divider(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).shadowColor,
                      thickness: 1),
                ]),
              ),
              InkWell(
                onTap: () {
                  if (isActive == true) {
                    setState(() {
                      isActive = false;
                    });
                  }
                  CacheHelper.saveData(key: "language", value: "ar");

                  LanguageCubit.get(context).languageChange(language: 'ar');
                },
                child: Column(children: [
                  Divider(
                      color: isActive
                          ? Theme.of(context).shadowColor
                          : Theme.of(context).primaryColor,
                      thickness: 1),
                  Text(
                    S.of(context).arabic_text,
                    style: TextStyle(
                      color: isActive
                          ? Theme.of(context).shadowColor
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                  Divider(
                      color: isActive
                          ? Theme.of(context).shadowColor
                          : Theme.of(context).primaryColor,
                      thickness: 1),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: defaultButton(
                    onPressed: () {
                      replacementNavigate(context, const OnBoardingScreen());
                    },
                    text: S.of(context).continue_title_button,
                    background: Theme.of(context).primaryColor,
                    height: 45,
                    radius: 50,
                    fontSize: 20),
              ),
            ]),
          ),
        );
      },
    );
  }
}
