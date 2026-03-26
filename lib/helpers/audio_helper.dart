import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> _playSound(String fileName) async {
    try {
      await _player.play(AssetSource('sounds/$fileName'));
    } catch (e) {
      // Si el archivo no existe, la app no crasheará.
      // Así puedes añadir los archivos .map (mp3 o wav) en assets/sounds/ más adelante.
    }
  }

  static Future<void> playCorrect() async {
    await _playSound('correct.mp3');
  }

  static Future<void> playIncorrect() async {
    await _playSound('incorrect.mp3');
  }

  static Future<void> playLessonComplete() async {
    await _playSound('lesson_complete.mp3');
  }

  static Future<void> playLessonFailed() async {
    await _playSound('lesson_failed.mp3');
  }

  static Future<void> playCategoryComplete() async {
    await _playSound('category_complete.mp3');
  }
}
