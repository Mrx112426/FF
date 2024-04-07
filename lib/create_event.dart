import 'package:flutter/material.dart';
import 'NavBar.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _travel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((50.0)),
        child: AppBar(
            title: Text('')
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
        children: <Widget>[
          Center(
            child: Text(
              'Что вы хотите сделать ?',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          _getButtons(),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Место',
                icon: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue[50],
                  ),
                  child: Icon(
                    Icons.location_on,
                    size: 25.0,
                    color: Colors.indigo.shade900,
                  ),
                )),
          ),
          Divider(
            height: 40.0,
          ),
          TextField(
            enabled: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Период',
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[50],
                ),
                child: Icon(
                  Icons.calendar_today,
                  size: 25.0,
                  color: Colors.indigo.shade900,
                ),
              ),
            ),
          ),
          Divider(
            height: 40.0,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Количество человек',
                icon: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue[50],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 25.0,
                      color: Colors.indigo.shade900,
                    ))),
          ),
          Divider(
            height: 40.0,
          ),
          Center(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade900),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              onPressed: () => print('Поиск'),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 130.0),
                child: Text(
                  'Поиск',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Самые популярные события',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          )
        ],
      ),
    );
  }

  _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _travel == true ? Colors.amber : Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: _travel == true ? Colors.transparent! : Colors.grey[300]!,
                ),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              _travel = true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'Создать\nсобытие',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Выравнивание по ширине
              softWrap: true, // Разрешает перенос текста на следующую строку
            ),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              _travel == false ? Colors.amber : Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: _travel == false ? Colors.transparent! : Colors.grey[300]!,
                ),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              _travel = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Text(
              'Найти\nсобытие',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Выравнивание по ширине
              softWrap: true, // Разрешает перенос текста на следующую строку
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(inContext) async {
    DateTime _selectedDate = (await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ))!;
  }
}