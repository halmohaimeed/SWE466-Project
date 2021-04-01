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
}
