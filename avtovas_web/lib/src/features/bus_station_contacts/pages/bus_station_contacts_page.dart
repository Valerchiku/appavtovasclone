import 'package:avtovas_web/src/features/bus_station_contacts/utils/web_mock_contact.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_contacts_page_body.dart';
import 'package:flutter/material.dart';

class BusStationContactsPage extends StatelessWidget {
  const BusStationContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BusStationContactsPageBody(
        contacts: [
          WebMockContact(
              title: 'Чебоксары - Центральный автовокзал',
              address: '428020, Чувашская республика, г. Чебоксары, проспект Мира, 78',
              phone: '28-90-00',
          ),
          WebMockContact(
            title: 'Чебоксары - Пригородный автовокзал',
            address: '428020, Чувашская республика, г. Чебоксары, ул. Привокзальная, 3',
            phone: '56-35-05',
          ),
          WebMockContact(
            title: 'Алатырь - ДКП г. Алатырь',
            address: '429810,Чувашская республика, г. Алатырь, ул. Горького, дом 34',
            phone: '+7 (906) 386-91-95',
          ),
          WebMockContact(
            title: 'Аликово - ДКП с. Аликово',
            address: '429520, Чувашская республика, с. Аликово, ул. Советская, 9',
            phone: '+7 (906) 386-92-33',
          ),
          WebMockContact(
            title: 'Батырево - ДКП с. Батырево',
            address: '429530, Чувашская республика, с. Батырево, ул. Дружбы д.6 «В»',
            phone: '+7 (906) 386-91-56',
          ),
          WebMockContact(
            title: 'Вурнары - ДКП п. Вурнары',
            address: '429200, Чувашская республика, п. Вурнары, ул. К.Маркса, 52',
            phone: '+7 (906) 386-92-80',
          ),
          WebMockContact(
            title: 'Ибреси - ДКП п. Ибреси',
            address: '429700, Чувашская республика, п. Ибреси, ул. Маресьева, 12',
            phone: '+7 (906) 386-92-81',
          ),
          WebMockContact(
            title: 'Комсомольское - ДКП с. Комсомольское',
            address: '429140, Чувашская республика,с. Комсомольское, ул. Канашская, 35',
            phone: '+7 (906) 386-91-37',
          ),
          WebMockContact(
            title: 'Красные - Четаи - ДКП с. Красные Четаи',
            address: '429040, Чувашская республика, село Красные Четаи, улица 1-ая заводская, д. 67',
            phone: '+7 (906) 386-94-62',
          ),
          WebMockContact(
            title: 'Новочебоксарск - ДКП г. Новочебоксарск',
            address: '429959, Чувашская республика, г.Новочебоксарск, ул. Семёнова,27',
            phone: '75-90-04',
          ),
          WebMockContact(
            title: 'Урмары - ДКП п. Урмары',
            address: '429400, Чувашская республика, посёлок Урмары, улица Октябрьская, д. 7',
            phone: '+7 (906) 386-92-89',
          ),
          WebMockContact(
            title: 'Шумерля - ДКП г. Шумерля',
            address: '429120, Чувашская республика, город Шумерля, улица Октябрьская, д. 1',
            phone: '+7 (906) 386-95-52',
          ),
          WebMockContact(
            title: 'Ядрин - ДКП г. Ядрин',
            address: '429060, Чувашская республика, город Ядрин, улица 50 лет Октября, 24',
            phone: '+7 (906) 386-92-21',
          ),
          WebMockContact(
            title: 'Яльчики - ДКП с. Яльчики',
            address: '429380, Чувашская республика, с. Яльчики, улица Привокзальная д.1',
            phone: '+7 (906) 386-91-92',
          ),
          WebMockContact(
            title: 'Янтиково - ДКП с. Янтиково',
            address: '429290, Чувашская республика, село Янтиково, проспект Ленина,1',
            phone: '+7 (906) 386-92-01',
          ),
          WebMockContact(
            title: 'Шемурша - ДКП с. Шемурша',
            address: '4291150, Чувашская республика, с. Шемурша, ул. Космовского д.4',
            phone: '+7 (906) 386-94-79',
          ),
        ],
      ),
    );
  }
}
