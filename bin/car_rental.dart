abstract class Rentable {
  void rent();
  void returnVehicle();
}

class Vehicle {
  final String _vehicleId;
  final String _model;
  final String _make;
  final int _year;
  final double _rentalPricePerDay;
  bool _isAvailable;

  Vehicle(this._vehicleId, this._model, this._make, this._year, this._rentalPricePerDay, this._isAvailable);

  void markAsRented() {
    _isAvailable = false;
  }

  void markAsAvailable() {
    _isAvailable = true;
  }

  void getDetails() {
    print("Vehicle ID: $_vehicleId, Model: $_model, Make: $_make, Year: $_year, Price: \$$_rentalPricePerDay");
  }
}

class Car extends Vehicle implements Rentable {
  final int _seatingCapacity;

  Car(super.vehicleId, super.model, super.make, super.year, super.rentalPricePerDay, super.isAvailable, this._seatingCapacity);

  @override
  void rent() {
    if (_isAvailable) {
      markAsRented();
      print("Car $_model is now rented.");
    } else {
      print("Car $_model is not available for rent.");
    }
  }

  @override
  void returnVehicle() {
    markAsAvailable();
    print("Car $_model has been returned.");
  }

  @override
  void getDetails() {
    super.getDetails();
    print("Seating Capacity: $_seatingCapacity");
  }
}
class Customer {
  String _customerId; 
  String _name;      
  String _email;      
  String _phone;    

  // Constructor
  Customer(this._customerId, this._name, this._email, this._phone);

  // Getter for customer ID
  String get customerId => _customerId;

  // Setter for customer ID
  set customerId(String value) {
    _customerId = value;
  }

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String value) {
    _name = value;
  }

  // Getter for email
  String get email => _email;

  // Setter for email with validation
  set email(String value) {
    if (value.contains('@')) {
      _email = value;
    } else {
      print("Invalid email address.");
    }
  }

  // Getter for phone
  String get phone => _phone;

  // Setter for phone with validation
  set phone(String value) {
    if (value.length >= 10) {
      _phone = value;
    } else {
      print("Phone number must have at least 10 digits.");
    }
  }

  // Method to display customer details
  void getDetails() {
    print("Customer ID: $_customerId, Name: $_name, Email: $_email, Phone: $_phone");
  }
}

// Base class: Booking
class Booking {
  String _bookingId;
  Customer _customer;
  Car _car;
  DateTime _startDate;
  DateTime _endDate;
  double _totalCost;
  String _status;

  Booking(this._bookingId, this._customer, this._car, this._startDate, this._endDate) {
    _totalCost = calculateTotalCost();
    _status = "Pending";
  }

  double calculateTotalCost() {
    int days = _endDate.difference(_startDate).inDays;
    return days * _car.rentalPricePerDay;
  }

  void confirmBooking() {
    _status = "Confirmed";
    _car.markAsRented();
  }

  void cancelBooking() {
    _status = "Cancelled";
    _car.markAsAvailable();
  }

  void getDetails() {
    print("Booking ID: $_bookingId");
    print("Customer: ${_customer.name}");
    print("Car: ${_car._model}");
    print("Start Date: $_startDate");
    print("End Date: $_endDate");
    print("Total Cost: \$$_totalCost");
    print("Status: $_status");
  }
}

void main() {
 
}