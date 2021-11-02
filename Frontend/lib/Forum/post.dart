class Post {
  final int id;
  final String name;
  final String user_name;
  final String avatar_template;
  String raw;
  String cooked;
  String topic_title;
  final String display_username;
  final String topic_id;
  int category_id;
  List<String> target_usernames;

  Post(
      {this.id,
        this.name,
        this.user_name,
        this.avatar_template,
        this.topic_title,
        this.display_username,
        this.topic_id,
        this.raw,
        this.cooked,
        this.category_id,
        this.target_usernames});
}
