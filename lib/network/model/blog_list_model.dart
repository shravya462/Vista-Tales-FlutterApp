import 'package:hive/hive.dart';
part 'blog_list_model.g.dart';

@HiveType(typeId: 0)
class BlogListModel {
  @HiveField(0)
  final String city;
  @HiveField(1)
  final String place;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
  final String description;

  const BlogListModel(this.city, this.place, this.imagePath, this.description);
}
