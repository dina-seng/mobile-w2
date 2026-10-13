class MyDuration {
  final int _milliseconds;

  const MyDuration._internal(int milliseconds)
    : _milliseconds = milliseconds >= 0 ? milliseconds : 0;

  MyDuration.fromHours(int hours) : this._internal(hours * 3600 * 1000);

  MyDuration.fromMinutes(int minutes) : this._internal(minutes * 60 * 1000);

  MyDuration.fromSeconds(int seconds) : this._internal(seconds * 1000);

  int get milliseconds => _milliseconds;

  //Addition return a new customer duration

  MyDuration operator +(MyDuration other) {
    return MyDuration._internal(this._milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int resultMilliseconds = this._milliseconds - other._milliseconds;

    if (resultMilliseconds < 0) {
      throw Exception("Error: Duration cannot be negative");
    }

    return MyDuration._internal(resultMilliseconds);
  }

  bool operator >(MyDuration other) {
    return this.milliseconds > other._milliseconds;
  }

  //   // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
