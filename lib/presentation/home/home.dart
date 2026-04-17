import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:bacokanucok/common/widgets/button/rounded_button.dart';
import 'package:bacokanucok/common/widgets/text/simple_center_text.dart';
import 'package:bacokanucok/core/configs/assets/app_images.dart';
import 'package:bacokanucok/core/configs/constants/app_router.dart';
import 'package:bacokanucok/core/configs/theme/app_colors.dart';
import 'package:bacokanucok/main_router_game.dart';
import 'package:bacokanucok/presentation/home/widgets/game_mode_component.dart';
import 'package:bacokanucok/presentation/home/widgets/tutorial_fruit_component.dart';

class HomePage extends Component with HasGameReference<MainRouterGame> {
  late final RoundedButton _button;

  late final SimpleCenterText _tutorialRuleLose1Component;
  late final SimpleCenterText _tutorialRuleLose2Component;
  late final SimpleCenterText _tutorialRuleScore1Component;
  late final SimpleCenterText _tutorialRuleScore2Component;

  // ignore: unused_field
  late final TextComponent _ediblesTextComponent;
  late final TextComponent _bombTextComponent;

  late final InteractiveButtonComponent _gameModeComponent;

  @override
  void onLoad() async {
    super.onLoad();

    final textTitlePaint = TextPaint(
      style: const TextStyle(
        fontSize: 26,
        color: AppColors.white,
        fontFamily: 'Insan',
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
      ),
    );
    if (game.size.x > 600 && game.size.y > 400) {
      addAll([
        _ediblesTextComponent = TextComponent(
          text: 'Buah',
          position: Vector2(45, 10),
          anchor: Anchor.topLeft,
          textRenderer: textTitlePaint,
        ),
        TutorialFruitsListComponent(
          isLeft: true,
          fruits: [
            TutorialFruitComponent(text: 'Apel', imagePath: AppImages.apple, isLeft: true),
            TutorialFruitComponent(text: 'Pisang', imagePath: AppImages.banana, isLeft: true),
            TutorialFruitComponent(text: 'Ceri', imagePath: AppImages.cherry, isLeft: true),
            TutorialFruitComponent(text: 'Kiwi', imagePath: AppImages.kiwi, isLeft: true),
            TutorialFruitComponent(text: 'Jeruk', imagePath: AppImages.orange, isLeft: true),
          ],
        )..position = Vector2(0, 50),
        _bombTextComponent = TextComponent(
          text: 'Bom',
          position: Vector2(game.size.x - 45, 10),
          anchor: Anchor.topRight,
          textRenderer: textTitlePaint,
        ),
        TutorialFruitsListComponent(
          isLeft: false,
          fruits: [
            TutorialFruitComponent(text: 'Bom', imagePath: AppImages.bomb, isLeft: false),
            TutorialFruitComponent(text: 'Api', imagePath: AppImages.flame, isLeft: false),
            TutorialFruitComponent(text: 'Flutter', imagePath: AppImages.flutter, isLeft: false),
          ],
        )..position = Vector2(0, 50),
      ]);

      game.isDesktop = true;
    } else {
      game.isDesktop = false;
    }

    addAll(
      [
        _button = RoundedButton(
          text: 'Mulai',
          onPressed: () {
            game.startBgmMusic();
            game.router.pushNamed(AppRouter.gamePage);
          },
          bgColor: AppColors.blue,
          borderColor: AppColors.white,
        ),
        _tutorialRuleLose1Component = SimpleCenterText(
          text: 'Kalau kena bom kamu kalah,',
          textColor: AppColors.white,
          fontSize: game.isDesktop ? 28 : 20,
        ),
        _tutorialRuleLose2Component = SimpleCenterText(
          text: 'melewatkan tiga buah juga kalah.',
          textColor: AppColors.white,
          fontSize: game.isDesktop ? 28 : 20,
        ),
        _tutorialRuleScore1Component = SimpleCenterText(
          text: 'Tebas 1 buah dapat 1 poin,',
          textColor: AppColors.white,
          fontSize: game.isDesktop ? 28 : 20,
        ),
        _tutorialRuleScore2Component = SimpleCenterText(
          text: 'satu tebasan bisa dapat banyak poin.',
          textColor: AppColors.white,
          fontSize: game.isDesktop ? 28 : 20,
        ),
        _gameModeComponent = InteractiveButtonComponent(
          size: Vector2(50, 50), // Adjust size as needed
          position: Vector2(150, 200), // Adjust position as needed
        )..anchor = Anchor.bottomRight,
      ],
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    // button in center of page
    _button.position = size / 2;

    _tutorialRuleScore1Component.position =
        Vector2(game.size.x / 2, game.size.y - game.size.y / 3.9);
    _tutorialRuleScore2Component.position =
        Vector2(game.size.x / 2, game.size.y - game.size.y / 5.1);
    _tutorialRuleLose1Component.position = Vector2(game.size.x / 2, game.size.y / 5.1);
    _tutorialRuleLose2Component.position = Vector2(game.size.x / 2, game.size.y / 3.9);

    _gameModeComponent.position = Vector2(game.size.x - 50, game.size.y - 50);

    if (game.isDesktop) _bombTextComponent.position = Vector2(game.size.x - 45, 10);
  }
}
