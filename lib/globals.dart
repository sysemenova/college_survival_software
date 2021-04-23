// A place for global variables. Use as necessary!


var currDt = DateTime.now();

void main() {
  currDt = DateTime.now();
}

void addToDate(Duration toAdd) {
  currDt = currDt.add(toAdd);
}