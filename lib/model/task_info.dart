class Post {
  final String catagory;
  final String title;
  final String dueDate;
  final String priority;
  final bool status;

  const Post({
    required this.catagory,
    required this.title,
    required this.dueDate,
    required this.priority,
    required this.status,
  });
  Map<String, dynamic> toJson() => {
        "catagory": catagory,
        "title": title,
        "dueDate": dueDate,
        "priority": priority,
      };
}
