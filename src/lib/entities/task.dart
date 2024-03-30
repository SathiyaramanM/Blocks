import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id;

  String title;

  String? description;

  int noOfBlocks;

  Task(
      {this.id = 0,
      required this.title,
      this.description,
      required this.noOfBlocks});
}
