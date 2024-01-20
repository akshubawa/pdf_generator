import 'package:agarwal_packers/views/lr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agarwal_packers/views/quotation_view.dart';
import 'package:agarwal_packers/views/bill_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agarwal Packers & Movers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_copy_outlined,
                              size: 50,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Quotation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        label: const SizedBox.shrink(),
                        style: const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(150, 150)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder())),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuotationView(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        icon: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fire_truck,
                              size: 50,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "LR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        label: const SizedBox.shrink(),
                        style: const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(150, 150)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder())),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LrView(),
                            ),
                          );
                        },
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.square_favorites_fill,
                            size: 50,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Bill",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      label: const SizedBox.shrink(),
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(150, 150)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder())),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BillView(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      icon: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.money_dollar_circle,
                            size: 50,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Money",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Receipt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      label: const SizedBox.shrink(),
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(150, 150)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder())),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BillView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
