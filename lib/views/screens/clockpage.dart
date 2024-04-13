import 'package:clock_app/utils/digital.dart';
import 'package:clock_app/views/commponets/clock_Optiontile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/views/commponets/clock.dart';

import '../../utils/month.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime d = DateTime.now();
  bool _isAnalog = true;
  bool _isStrap = false;
  bool _isDigital = false;
  bool _isStop = false;
  bool _isimage = false;

  bool isStop = false;
  int second = 00;
  int milis = 00;
  int min = 00;
  bool b = false;
  int a = 0;
  late String image =
      'https://img.freepik.com/free-photo/white-paper-texture_1194-5998.jpg';

  void timer() {
    isStop = true;
    Future.delayed(
      const Duration(milliseconds: 3),
      () {
        setState(
          () {
            if (isStop) {
              milis++;
            }

            if (milis > 59) {
              second++;
              milis = 0;
            }
            if (second > 59) {
              min++;
              second = 0;
            }
            if (min > 59) {
              min = 0;
            }
          },
        );
        if (isStop) {
          timer();
        }
      },
    );
  }

  void clock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      clock();
    });
  }

  @override
  void initState() {
    super.initState();
    clock();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Theme(
        data: ThemeData(
          useMaterial3: true,
        ),
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Vinisha Lathiya'),
                accountEmail: Text('lathiyavinisha03@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    CupertinoIcons.person_alt,
                    size: 50,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              clockOptionTile(
                title: 'Analog Clock',
                val: _isAnalog,
                onChanged: (val) => setState(
                  () => _isAnalog = !_isAnalog,
                ),
              ),
              clockOptionTile(
                title: 'Strap Clock',
                val: _isStrap,
                onChanged: (val) => setState(
                  () => _isStrap = !_isStrap,
                ),
              ),
              clockOptionTile(
                title: 'Digital Clock',
                val: _isDigital,
                onChanged: (val) => setState(
                  () => _isDigital = !_isDigital,
                ),
              ),
              clockOptionTile(
                title: 'Stop Watch',
                val: _isStop,
                onChanged: (val) => setState(
                  () => _isStop = !_isStop,
                ),
              ),
              clockOptionTile(
                title: 'Background',
                val: _isimage,
                onChanged: (val) => setState(
                  () => _isimage = !_isimage,
                ),
              ),
              _isimage
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          images.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                image = images[index];
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: image == images[index]
                                      ? Colors.black
                                      : Colors.white,
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    images[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Clock',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          //image
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                _isimage
                    ? image
                    : 'https://img.freepik.com/free-photo/white-paper-texture_1194-5998.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // analog clock
              Visibility(
                visible: _isAnalog,
                child: clock1(size: size, d: d, isimage: _isimage),
              ),
              // strap
              Visibility(
                visible: _isStrap,
                child: Center(
                  child: Stack(
                    children: [
                      // hour
                      Transform.scale(
                        scale: 6,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: d.hour / 12,
                        ),
                      ),
                      // min
                      Transform.scale(
                        scale: 4,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: d.minute / 60,
                        ),
                      ),
                      // second
                      Transform.scale(
                        scale: 2,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: d.second / 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // stop watch
              Visibility(
                visible: _isStop,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "${min.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')}. ${milis.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                if (!isStop) {
                                  timer();
                                }
                              },
                              icon: const Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple),
                              ),
                            ),
                            const SizedBox(
                              width: 22,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                isStop = false;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Stop',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple),
                              ),
                            ),
                            const SizedBox(
                              width: 22,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                isStop = false;
                                min = milis = second = 0;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.stop,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Restart',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // digital
              Visibility(
                visible: _isDigital,
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      digital_row(
                          d: d, isdigital: _isDigital, isimage: _isimage),
                      Text(
                        "${day[d.weekday - 1]} , ${d.day.toString()} ${month[d.month - 1]}",
                        style: TextStyle(
                            fontSize: 20,
                            color: _isimage == true
                                ? Colors.white
                                : Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
