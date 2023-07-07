class Post {
  final String catagory;
  final String title;
  final String dueDate;
  final String priority;

  const Post({
    required this.catagory,
    required this.title,
    required this.dueDate,
    required this.priority,
  });
  Map<String, dynamic> toJson() => {
        "catagory": catagory,
        "title": title,
        "dueDate": dueDate,
        "priority": priority,
      };
}
