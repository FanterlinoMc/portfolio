import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

// Main game class
class FlappyBirdGame extends FlameGame with TapDetector {
  late Bird bird;
  late ScrollingBackground background;
  late TextComponent scoreText;
  int score = 0;
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Load and add the scrolling background
    background = ScrollingBackground();
    add(background);

    // Load and add the bird
    bird = Bird()
      ..sprite = await loadSprite('bird.png')
      ..size = Vector2(50, 50)
      ..position = Vector2(size.x / 4, size.y / 2);
    add(bird);

    // Load and add the score text
    scoreText = TextComponent(
      text: 'Score: $score',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      position: Vector2(10, 10),
    );
    add(scoreText);
  }

  @override
  void onTap() {
    if (isGameOver) {
      restart();
    } else {
      bird.fly();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!isGameOver) {
      score += 1;
      scoreText.text = 'Score: $score';
    }
  }

  void gameOver() {
    isGameOver = true;
    add(TextComponent(
      text: 'Game Over',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.red,
          fontSize: 48,
        ),
      ),
      position: Vector2(size.x / 2 - 100, size.y / 2 - 24),
    ));
  }

  void restart() {
    isGameOver = false;
    score = 0;
    scoreText.text = 'Score: $score';
    bird.position = Vector2(size.x / 4, size.y / 2);
    bird.speedY = 0;
    removeWhere((component) =>
        component is TextComponent && component.text == 'Game Over');
  }
}

// Bird class
class Bird extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  static const double gravity = 800;
  static const double flyPower = -300;
  double speedY = 0;

  @override
  void update(double dt) {
    super.update(dt);
    speedY += gravity * dt;
    y += speedY * dt;

    if (y > gameRef.size.y - height) {
      y = gameRef.size.y - height;
      speedY = 0;
      gameRef.gameOver();
    }

    if (y < 0) {
      y = 0;
      speedY = 0;
    }
  }

  void fly() {
    speedY = flyPower;
  }
}

// Scrolling background class
class ScrollingBackground extends Component with HasGameRef<FlappyBirdGame> {
  late SpriteComponent background1;
  late SpriteComponent background2;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Load and add the first background segment
    background1 = SpriteComponent()
      ..sprite = await gameRef.loadSprite('background.png')
      ..size = gameRef.size
      ..position = Vector2(0, 0);
    add(background1);

    // Load and add the second background segment
    background2 = SpriteComponent()
      ..sprite = await gameRef.loadSprite('background.png')
      ..size = gameRef.size
      ..position = Vector2(gameRef.size.x, 0);
    add(background2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Move the background segments to the left
    background1.x -= 20 * dt;
    background2.x -= 20 * dt;

    // Reset the position of the background segments to create a seamless scrolling effect
    if (background1.x <= -gameRef.size.x) {
      background1.x = background2.x + gameRef.size.x;
    }

    if (background2.x <= -gameRef.size.x) {
      background2.x = background1.x + gameRef.size.x;
    }
  }

  @override
  void render(Canvas canvas) {
    background1.render(canvas);
    background2.render(canvas);
  }
}
