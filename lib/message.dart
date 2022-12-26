class Message {
  final String text;
  final String name;

  Message(this.text, this.name);

  Message.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'name': name,
      };
}
