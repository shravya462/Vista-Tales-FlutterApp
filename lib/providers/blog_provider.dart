import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:project/network/model/blog_list_model.dart';

final blogProvider =
    StateNotifierProvider<BlogNotifier, List<BlogListModel>>((ref) {
  return BlogNotifier();
});

class BlogNotifier extends StateNotifier<List<BlogListModel>> {
  BlogNotifier() : super([]) {
    loadBlogs();
  }

  void loadBlogs() async {
    final box = await Hive.openBox<BlogListModel>('blogs');
    state = box.values.toList();
  }

  void addBlog(BlogListModel blog) async {
    final box = await Hive.openBox<BlogListModel>('blogs');
    await box.add(blog);
    state = box.values.toList();
  }
}
