// create update read update

import 'package:spotify_app/Models/category.dart';

class categoryoperations {
  categoryoperations._() {} // since static no need to create any object-> named constructor "_" is used to declare private, so that it can be accessed within this library/file only
  static List<category> getCategories() {
    // no need to allocate memory again and again therefore we define the method as static
    return <category>[
      // to return list of categories
      category('Top Songs',
          'https://is4-ssl.mzstatic.com/image/thumb/Purple122/v4/f5/1e/85/f51e856c-52c9-a109-44c2-acf22f742643/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/256x256bb.jpg'),
      category('Top Hits',
          'https://i.scdn.co/image/ab67616d0000b273fe007ed6c4077531396c93bb'),
      category('Top MJ Hits',
          'https://podcastaddict.com/cache/artwork/thumb/1716409'),
      category('Top Hits',
          'https://i.scdn.co/image/ab67616d0000b273fe007ed6c4077531396c93bb'),
    ];
  }
}
