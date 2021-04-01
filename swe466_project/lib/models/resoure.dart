class Resource {
  String name;
  int count;
  double cost;

  Resource({this.name, this.count, this.cost});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "count": this.count,
      "cost": this.cost,
    };
  }

  static Resource fromJson(Map<String, dynamic> map) {
    return Resource(
      name: map['name'],
      count: map['count'],
      cost: map['cost'],
    );
  }
}
