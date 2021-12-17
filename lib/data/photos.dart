class Photos {
  late String id;
  late String title;
  late String src;
  Photos(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    src = json['src'];
  }
}
