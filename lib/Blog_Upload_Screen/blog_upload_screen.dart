import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/network/model/blog_list_model.dart';
import 'package:project/providers/blog_provider.dart';

class NewBlogScreen extends ConsumerStatefulWidget {
  @override
  _NewBlogScreenState createState() => _NewBlogScreenState();
}

class _NewBlogScreenState extends ConsumerState<NewBlogScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _uploadBlog() {
    if (_formKey.currentState!.validate() && _image != null) {
      final blog = BlogListModel(
        _cityController.text,
        _placeController.text,
        _image!.path,
        _descriptionController.text,
      );

      ref.read(blogProvider.notifier).addBlog(blog);
      print("blogs.imagePath :${blog.imagePath}");

      setState(() {
        _cityController.clear();
        _placeController.clear();
        _descriptionController.clear();
        _image = null;
      });

      Fluttertoast.showToast(msg: 'Blog is successfully uploaded');
    } else {
      Fluttertoast.showToast(msg: 'Please fill all fields and select an image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Blog'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait = constraints.maxWidth < constraints.maxHeight;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _cityController,
                            decoration: InputDecoration(labelText: 'City Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the city name';
                              }
                              return null;
                            },
                          ),
                        ),
                        if (!isPortrait) SizedBox(width: 16.0),
                        if (!isPortrait)
                          Expanded(
                            child: TextFormField(
                              controller: _placeController,
                              decoration:
                                  InputDecoration(labelText: 'Place Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the place name';
                                }
                                return null;
                              },
                            ),
                          ),
                      ],
                    ),
                    if (isPortrait) SizedBox(height: 16.0),
                    if (isPortrait)
                      TextFormField(
                        controller: _placeController,
                        decoration: InputDecoration(labelText: 'Place Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the place name';
                          }
                          return null;
                        },
                      ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: _image == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo,
                                        size: 50.0, color: Colors.grey),
                                    Text('Upload Image',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              )
                            : Image.file(
                                File(_image!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        print("blogs.imagePath :${_image!.path}");
                        _uploadBlog();
                      },
                      child: Text('Upload'),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
