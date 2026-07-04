import 'package:flutter/material.dart';

enum TripStatus { ongoing, completed, cancelled }

class Trip {
  final TripStatus status;
  final Color statusColor;
  final String route;
  final String flight;
  final String hotel;
  final String buttonLabel;
  final String imgPath;
  final String imgPathTittle;

  // Top summary card
  final String tripDateRange;      // "01 Jun - 06 Jun"
  final String progressStartDate;  // "01 Jun"
  final String progressEndDate;    // "06 Jun"
  final double progressPercent;    // 0.0 - 1.0

  // Hotel
  final String hotelName;
  final String hotelAddress;
  final String hotelRating;
  final String checkInDate;
  final String checkInDay;
  final String checkInTime;
  final String checkOutDate;
  final String checkOutDay;
  final String checkOutTime;
  final String nights;
  final String guestsRooms;

  // Flight
  final String airline;
  final String flightNumber;
  final String originCode;
  final String destinationCode;
  final String departureTime;
  final String departureDate;
  final String departureCity;
  final String arrivalTime;
  final String arrivalDate;
  final String arrivalCity;
  final String arrivalTerminal;
  final String flightDuration;
  final String stopsLabel;
  final String passengerName;
  final String seatNo;

  const Trip({
    required this.status,
    required this.statusColor,
    required this.route,
    required this.flight,
    required this.hotel,
    required this.buttonLabel,
    required this.imgPath,
    required this.imgPathTittle,
    required this.tripDateRange,
    required this.progressStartDate,
    required this.progressEndDate,
    required this.progressPercent,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelRating,
    required this.checkInDate,
    required this.checkInDay,
    required this.checkInTime,
    required this.checkOutDate,
    required this.checkOutDay,
    required this.checkOutTime,
    required this.nights,
    required this.guestsRooms,
    required this.airline,
    required this.flightNumber,
    required this.originCode,
    required this.destinationCode,
    required this.departureTime,
    required this.departureDate,
    required this.departureCity,
    required this.arrivalTime,
    required this.arrivalDate,
    required this.arrivalCity,
    required this.arrivalTerminal,
    required this.flightDuration,
    required this.stopsLabel,
    required this.passengerName,
    required this.seatNo,
  });

  String get statusLabel {
    switch (status) {
      case TripStatus.ongoing:
        return 'Ongoing';
      case TripStatus.completed:
        return 'Completed';
      case TripStatus.cancelled:
        return 'Cancelled';
    }
  }
}