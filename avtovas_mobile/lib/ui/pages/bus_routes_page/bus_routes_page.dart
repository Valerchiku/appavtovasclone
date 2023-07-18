import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_card/bus_routes_card.dart';
import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_search_field/bus_routes_search_field.dart';
import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_sort_by_field/bus_routes_sort_by_field.dart';
import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<Map<String, dynamic>> busTours = [
  {
    'route_number': 'Рейс №574',
    'railway_station_departure': 'Чебоксары Центральный АВ',
    'railway_station_arrival': 'Новочебоксарск АВ',
    'departure_city': 'Алатырь',
    'arrival_city': 'Новочебоксарск',
    'departure_date': '8 июля',
    'departure_time': '12:15',
    'travel_time': '6ч 55 ',
    'arrival_time': '19:10',
    'arrival_date': '9 июля',
    'price': '1 420, 00 руб.',
    'available_seats': '17 места',
  },
  {
    'route_number': 'Рейс №569',
    'railway_station_departure': 'Чебоксары Центральный АВ',
    'railway_station_arrival': 'Ардатов 569',
    'departure_city': 'Алатырь',
    'arrival_city': 'Ардатов',
    'departure_date': '8 июля',
    'departure_time': '17:00',
    'travel_time': '12ч 30 ',
    'arrival_time': '05:30',
    'arrival_date': '9 июля',
    'price': '1 200, 00 руб.',
    'available_seats': '3 места',
  },
  {
    'route_number': 'Рейс №576',
    'railway_station_departure': 'Чебоксары Центральный АВ',
    'railway_station_arrival': 'Новочебоксарск АВ',
    'departure_city': 'Алатырь',
    'arrival_city': 'Новочебоксарск',
    'departure_date': '8 июля',
    'departure_time': '18:15',
    'travel_time': '4ч 00 ',
    'arrival_time': '20:15',
    'arrival_date': '9 июля',
    'price': '1 310, 00 руб.',
    'available_seats': '39 места',
  },
  {
    'route_number': 'Рейс №583',
    'railway_station_departure': 'Чебоксары Центральный АВ',
    'railway_station_arrival': 'Ардатов 569',
    'departure_city': 'Алатырь',
    'arrival_city': 'Ардатов',
    'departure_date': '8 июля',
    'departure_time': '17:00',
    'travel_time': '12ч 30 ',
    'arrival_time': '05:30',
    'arrival_date': '9 июля',
    'price': '1 200, 00 руб.',
    'available_seats': '3 места',
  },
];

class BusRoutesPage extends StatefulWidget {
  const BusRoutesPage({super.key});

  @override
  State<BusRoutesPage> createState() => _BusRoutesListPageState();
}

class _BusRoutesListPageState extends State<BusRoutesPage> {
  List<String> sortBy = [
    'Сортировка по времени',
    'Сортировка по времени в пути',
    'Сортировка по дате',
    'Сортировка по цене',
  ];

  String sortByValue = 'Сортировка по времени';

  List<String> routes = [
    'Алатырь',
    'Ардатов',
    'Новочебоксарск',
  ];
  String departure_city = 'Алатырь';
  String arrival_city = 'Ардатов';

  void swapDropdownValues() {
    String temp = departure_city;
    setState(() {
      departure_city = arrival_city;
      arrival_city = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: 
          SvgPicture.asset('asset/icons/arrow.svg'),
          // Icon(Icons.abc)
        ),
        title: const Text(
          'Расписание',
          style: TextStyle(
            fontFamily: 'PTSans-Regular',
            fontSize: 20,
            height: 1.29,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Arrival & Departure Search Field
              // Поле Поиска Прибытия & Отправления
              BusRoutesSearchField(
                deviceSize: deviceSize,
                departure_city: departure_city,
                arrival_city: arrival_city,
                routes: routes,
                departureOnChanged: (value) {
                  setState(() {
                    departure_city = value!;
                  });
                },
                arrivalOnChanged: (value) {
                  setState(() {
                    arrival_city = value!;
                  });
                },
                swapDropdownValues: swapDropdownValues,
              ),
              const SizedBox(height: 16),

              // Bus Routes Sort by Field
              // Поля Сортировки Автобусных Маршрутов
              BusRoutesSortByField(
                deviceSize: deviceSize,
                sortByValue: sortByValue,
                sortBy: sortBy,
                sortOnChanged: (value) {
                  setState(() {
                    sortByValue = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Bus Routes
              // Автобусные Маршруты
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) => BusRoutesCard(
                  deviceSize: deviceSize,
                  route_number: busTours[index]['route_number'],
                  railway_station_departure: busTours[index]
                      ['railway_station_departure'],
                  railway_station_arrival: busTours[index]
                      ['railway_station_arrival'],
                  departure_city: busTours[index]['departure_city'],
                  arrival_city: busTours[index]['arrival_city'],
                  departure_date: busTours[index]['departure_date'],
                  departure_time: busTours[index]['departure_time'],
                  travel_time: busTours[index]['travel_time'],
                  arrival_date: busTours[index]['arrival_date'],
                  arrival_time: busTours[index]['arrival_time'],
                  price: busTours[index]['price'],
                  available_seats: busTours[index]['available_seats'],
                  buy_ticket: () => null,
                ),
                itemCount: busTours.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
