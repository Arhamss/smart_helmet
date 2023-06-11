import 'package:flutter/material.dart';

class StartRidePage extends StatefulWidget {
  static const String id = 'StartRidePage';
  const StartRidePage({super.key});

  @override
  State<StartRidePage> createState() => _StartRidePageState();
}

class _StartRidePageState extends State<StartRidePage> {
  timer(int time) async {
    while (time != 0) {
      setState(() {
        time--;
      });

      await Future.delayed(
        const Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'svgs/maps.webp',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF08f4dc),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Text(
                    'Safe Travels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 220,
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        int time = 60;

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              content: Text(
                                'Automatic Alert in $time Seconds',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor:
                                  const Color(0xFF08f4dc).withOpacity(0.5),
                              title: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Text(
                                      'Accident Detected',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (time < 10) {
                                      setState(() {
                                        time = 0;
                                      });

                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Icon(
                                                    Icons.bus_alert,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                const Text(
                                                  'Help is on the way',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        time = time ~/ 2;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Alert'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: const Color(0xFF08f4dc),
                    shape: const StadiumBorder(),
                  ),
                  child: const Center(
                    child: Text(
                      'Trigger',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: Container(
                height: 90,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF08f4dc),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF08f4dc),
                      shape: const StadiumBorder(),
                    ),
                    child: const Center(
                      child: Text(
                        'End Ride',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
