import 'package:flutter_training/search/data/constants/image_manger.dart';

class DataList {
  static const List<Course> coursesList = [
    Course(
        name: 'java',
        id: 0,
        imgPath: ImageManger.img1,
        totalHours: 10,
        instructor: 'A'),
    Course(
        name: 'c++',
        id: 1,
        imgPath: ImageManger.img2,
        totalHours: 3,
        instructor: 'B'),
    Course(
        name: 'dart',
        id: 2,
        imgPath: ImageManger.img3,
        totalHours: 40,
        instructor: 'C'),
    Course(
        name: 'java script',
        id: 3,
        imgPath: ImageManger.img4,
        totalHours: 4,
        instructor: 'A'),
    Course(
        name: 'c#',
        id: 4,
        imgPath: ImageManger.img5,
        totalHours: 10,
        instructor: 'B'),
    Course(
        name: 'go',
        id: 5,
        imgPath: ImageManger.img2,
        totalHours: 15,
        instructor: 'A'),
    Course(
        name: 'swift',
        id: 6,
        imgPath: ImageManger.img3,
        totalHours: 5,
        instructor: 'R'),
    Course(
        name: 'objective c',
        id: 7,
        imgPath: ImageManger.img1,
        totalHours: 5,
        instructor: 'O'),
    Course(
        name: 'kotlin',
        id: 8,
        imgPath: ImageManger.img4,
        totalHours: 10,
        instructor: 'B'),
    Course(
        name: 'python',
        id: 9,
        imgPath: ImageManger.img5,
        totalHours: 3,
        instructor: 'G'),
    Course(
        name: 'go2',
        id: 10,
        imgPath: ImageManger.img1,
        totalHours: 8,
        instructor: 'N'),
    Course(
        name: 'python2',
        id: 11,
        imgPath: ImageManger.img2,
        totalHours: 1,
        instructor: 'S'),
    Course(
        name: 'c',
        id: 12,
        imgPath: ImageManger.img3,
        totalHours: 6,
        instructor: 'N'),
    Course(
        name: 'html',
        id: 13,
        imgPath: ImageManger.img4,
        totalHours: 2,
        instructor: 'S'),
    Course(
        name: 'css',
        id: 14,
        imgPath: ImageManger.img5,
        totalHours: 1,
        instructor: 'S'),
    Course(
        name: 'flutter',
        id: 15,
        imgPath: ImageManger.img2,
        totalHours: 25,
        instructor: 'c'),
    Course(
        name: 'R',
        id: 16,
        imgPath: ImageManger.img1,
        totalHours: 6,
        instructor: 'A'),
    Course(
        name: 'Type script',
        id: 17,
        imgPath: ImageManger.img5,
        totalHours: 50,
        instructor: 'N'),
    Course(
        name: 'visual basic',
        id: 18,
        imgPath: ImageManger.img3,
        totalHours: 100,
        instructor: 'A'),
  ];
}

class Course {
  final String name;
  final int id;
  final double totalHours;
  final String imgPath;
  final String instructor;
  const Course({
    required this.name,
    required this.id,
    required this.imgPath,
    required this.totalHours,
    required this.instructor,
  });
}
