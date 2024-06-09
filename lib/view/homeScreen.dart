import 'package:calculater_provider/provider/cal_provider.dart';
import 'package:calculater_provider/widget/bottonList.dart';
import 'package:calculater_provider/widget/botton_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.sizeOf(context).height * 1;
    var width = MediaQuery.sizeOf(context).width * 1;

    return Consumer<CalculaterProvider>(builder: (context, value, _) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Calculater",
            style: GoogleFonts.acme(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 35),
                cursorColor: Colors.black,
                controller: value.calcuControlled,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: hight * .6,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => bottonList[index])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => bottonList[index + 4])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(4, (index) => bottonList[index + 8])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => bottonList[index + 12])),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => bottonList[index + 16])),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Provider.of<CalculaterProvider>(context,
                                        listen: false)
                                    .setValue("=");
                              },
                              child: Card(
                                color: Colors.blue.shade200,
                                elevation: 20,
                                child: Container(
                                  height: 130,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                      child: Text(
                                    "=",
                                    style: TextStyle(fontSize: 25),
                                  )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
