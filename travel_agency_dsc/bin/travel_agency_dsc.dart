/*
Trip fields: ID, Location, Passenger limit, price
Methods required: Add Trip (Done), Edit Trip (Done), Delete Trip (Done),
View Trips Ordered by date (Done), Search Trip by price (Done), Book a trip (Done)

Bonus Methods: 20% discount on trips greater than 10000 L.E (Done),
Display last 10 trips (Done),
View Trip Passengers (Done).

Good Luck!
 */

import 'dart:io';
import 'dart:core';


class Trips {
  String _id;
  String _location;
  int _ppl_limit;
  double _price;
  DateTime _date;
  List<Passenger> ppl=[];
  int _ppl_count=0;
  Trips() {
    print('Please fill the trip info..');
    print('ID: ');
    String id = stdin.readLineSync();
    print('Location: ');
    String location = stdin.readLineSync();

    print('Date: ');
    print('Please enter date in the following format: 1970-01-01 18:00');
    String input_date = stdin.readLineSync();
    _date=DateTime.parse(input_date);

    print('Passenger Limit: ');
    int ppl_limit = int.parse(stdin.readLineSync());

    print('Price: ');
    double price = double.parse(stdin.readLineSync());

    print('Adding Trip...');

    set_info(id, location, ppl_limit, price, input_date);

    if(price >= 10000){
      print('Trip price is greater than 10000, Applying 20% discount...');
      price = price - (price/5);
      print('New price: $price');
    }

    print('Success!');

  }

  void set_info(
      String id, String location, int ppl_limit, double price, String input_date) {
    _id = id;
    _location = location;
    _ppl_limit = ppl_limit;
    _price = price;
    _date = DateTime.parse(input_date);
  }

  void edit_trip(Trips t) {
    print('Please re-fill the trip info..');

    print('Location: ');
    String location = stdin.readLineSync();

    print('Date: ');
    print('Please enter date in the following format: 1970-01-01 18:00');
    String input_date = stdin.readLineSync();

    print('Passenger Limit: ');
    int ppl_limit = int.parse(stdin.readLineSync());

    print('Price: ');
    double price = double.parse(stdin.readLineSync());

    print('Saving info...');

    set_info(t.get_id(), location, ppl_limit, price, input_date);

    print('Success!');

    }

  get_ppl_count() => _ppl_count;

  increase_ppl_count() => _ppl_count++;

  DateTime get_date_object() => _date;

  set_price(double value) {
    _price = value;
  }

  set_ppl_limit(int value) {
    _ppl_limit = value;
  }

  set_location(String value) {
    _location = value;
  }

  set_id(String value) {
    _id = value;
  }

  String get_location() => _location;

  int get_ppl_limit() => _ppl_limit;

  double get_price() => _price;

  String get_date() => _date.toString();

  String get_id() => _id;
}

class Passenger {
  String _pass_id;
  String _name;
  String _phone;
  String _email;
  String _national_id;

  String get_pass_id() => _pass_id;

  set_pass_id(String value) {
    _pass_id = value;
  }

  void set_info(String pass_id, String name, String phone, String email,
      String national_id) {
    _pass_id = pass_id;
    _name = name;
    _phone = phone;
    _email = email;
    _national_id = national_id;
  }

  String get_name() => _name;

  set_name(String value) {
    _name = value;
  }

  String get_phone() => _phone;

  set_phone(String value) {
    _phone = value;
  }

  String get_email() => _email;

  set_email(String value) {
    _email = value;
  }

  String get_national_id() => _national_id;

  set_national_id(String value) {
    _national_id = value;
  }
}

void main(List<String> arguments) {
  print('Welcome!');
  List<Trips> trips=[];
  bool exit=false;

  while(exit==false) {
    print('Choose your option..');
    print('1: Add new trip');
    print('2: Edit a trip');
    print('3: Delete a trip');
    print('4: Display a detailed list of trips');
    print('5: Book a trip ');
    print('6: Search trips by price');
    print('7: Display last 10 trips');
    print('10: Exit');
    String choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        {
          Trips t1 = new Trips();
          add_trip(trips,t1);
          break;
        }
      case '2':
        {
          print('Select trip ID: ');
           show_trip_ids(trips);
           String key_id = stdin.readLineSync();
           int target= find_by_id(trips, key_id);
          trips[target].edit_trip(trips[target]);
          break;
        }
      case '3':{
        delete_trip(trips);
        print('Success!');
        break;

      }
      case '4':{
        show_all_trips(trips);
        break;
      }
      case '5':{
        Passenger p=new Passenger();
        book_trip(trips, p);
        break;
      }
      case '6':{
        print('Enter the desired price: ');
        double key_price = double.parse(stdin.readLineSync());
        search_price(trips, key_price);
        break;
      }
      case '7':{
        show_latest_trips(trips);
        break;
      }
      case '10':
        {
          print('Good Bye!');
          exit = true;
          break;
        }
    }
  }
}

void show_trip_ids(List<Trips> trips){
  print('Current Trips: ');
  for(int i=0; i<trips.length; i++){
    print(trips[i].get_id());
  }
}

int find_by_id(List<Trips> trips, String id){
  for(int i=0; i<trips.length; i++){
    if(trips[i].get_id() == id){
     return i;
    }
    else{
      continue;
    }
  }
  print('Not found!');
  return null;
}

void show_all_trips(List<Trips> trips){
  for(int i=0; i<trips.length; i++) {

    print('Trip ' + (i+1).toString() + ':');
    print('ID: ' +trips[i].get_id());
    print('Location: ' + trips[i].get_location());
    print('Date: ' + trips[i].get_date());
    print('Passenger Limit: ' + trips[i].get_ppl_limit().toString());
    print('Price: ' + trips[i].get_price().toString());
    show_trip_ppl(trips[i]);
    print('---------------------');
  }
}

void delete_trip(List<Trips> trips){
  print('Enter the ID of the trip: ');
  String key_id = stdin.readLineSync();
  int key = find_by_id(trips, key_id);
  trips.removeAt(key);
  show_trip_ids(trips);
}

void book_trip(List<Trips> trips, Passenger p){
  print('Enter trip ID: ');
  String id = stdin.readLineSync();
  int key_id = find_by_id(trips, id);
  trips[key_id].ppl.add(p);

  if(trips[key_id].get_ppl_count() < trips[key_id].get_ppl_limit()) {
    print('Enter passenger info: ');
    print('Passenger ID: ');
    String pass_id = stdin.readLineSync();
    print('Name: ');
    String pass_name = stdin.readLineSync();
    print('Phone Number: ');
    String phone = stdin.readLineSync();
    print('Email: ');
    String email = stdin.readLineSync();
    print('National ID: ');
    String national_id = stdin.readLineSync();

    print('Adding Passenger...');
    p.set_info(pass_id, pass_name, phone, email, national_id);

    trips[key_id].increase_ppl_count();

    print('Success!');
  }
  else{
    print('No room left in this trip!');
  }

}

void show_trip_ppl(Trips t){
  print('Trip passengers: ');
 for(int i=0; i< t.ppl.length; i++){

   print((i+1).toString() + ': ' + t.ppl[i].get_pass_id() + ', ' + t.ppl[i].get_name());

 }
}

void add_trip(List<Trips> trips, Trips t){
  if(trips.isEmpty){
    trips.add(t);
    return;
  }
  else {
    for (int i = 0; i < trips.length; i++) {
      if (t.get_date_object().isBefore(trips[i].get_date_object())){
        trips.insert(i, t);
        break;
      }
      else if(i==trips.length-1){
        trips.add(t);
        break;
      }
      else{
        continue;
      }
    }
  }
}

void search_price(List<Trips> trips, double price){
  for(int i=0; i < trips.length; i++){
    if(trips[i].get_price() <= price){
      show_trip_details(trips[i]);
    }
    else{
      continue;
    }
  }
}

void show_trip_details(Trips t){

  print('ID: ' +t.get_id());
  print('Location: ' + t.get_location());
  print('Date: ' + t.get_date());
  print('Passenger Limit: ' + t.get_ppl_limit().toString());
  print('Price: ' + t.get_price().toString());
  show_trip_ppl(t);
  print('---------------------');
}

void show_latest_trips(List<Trips> trips){
  int limit=10;
  int trips_count = trips.length;
  if(trips_count < 10){
    show_all_trips(trips);
  }
  else{
  for(int i = trips.length-1; limit !=0; i-- , limit--){
    show_trip_details(trips[i]);
  }
  }
}
