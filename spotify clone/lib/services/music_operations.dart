import 'package:spotify_app/Models/music.dart';

class musicoperations {
  musicoperations._() {}
  static List<music> getmusic() {
    return <music>[
      music(
          'Mehrma',
          'https://c-fa.cdn.smule.com/rs-s-sf-4/arr/26/b2/64f7da85-994f-4ee6-87cd-18362a274561.jpg',
          'o, mehrma, kya milaa ?',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/55/99/74/55997498-67c0-15c5-586e-2ca9fccbb39e/mzaf_13667038576094348566.plus.aac.p.m4a'),
      music(
          'Gully Boy',
          'https://c-fa.cdn.smule.com/rs-s95/arr/44/ec/a14c9db3-f454-4a86-80f0-ac9d42f6e87c.jpg',
          'Apna time aayga',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/ad/53/bf/ad53bf8c-9bf2-90d7-05d4-ec34186f33ff/mzaf_13379019530104319252.plus.aac.p.m4a'),
      music(
          'Bajirao Mastani',
          'https://c-fa.cdn.smule.com/rs-s-sf-1/arr/92/af/98c07bfa-c10c-4ef9-bce3-3860e48a0453.jpg',
          'Deewani Mastani',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/5b/98/a0/5b98a0c7-d7f3-036f-c8a1-dfc8638fa82a/mzaf_3760553148977015147.plus.aac.p.m4a')
    ];
  }
}
