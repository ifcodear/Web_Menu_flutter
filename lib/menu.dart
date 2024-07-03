import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  double height = 150;
  double bottomHeight = 140;
  double width = 400;
  double turns = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: height,
          width: width,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: bottomHeight,
                width: 390,
                child: const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      MenuDrop(text: "Ferrary", img: "images/ferrary.png"),
                      MenuDrop(text: "Red Bull", img: "images/redbull.png"),
                      MenuDrop(text: "Mac Larend", img: "images/ferrary.png"),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 140,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 201, 85, 85),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/2418/2418802.png"),
                          radius: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Formula 1",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Autos y Equipos de la F1',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    setState(() {
                      height = height == 150 ? 500 : 150;
                      bottomHeight = bottomHeight == 140 ? 500 : 140;
                      turns = turns == 0.5 ? 1 : 0.5;
                    });
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: const Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuDrop extends StatefulWidget {
  final String text;
  final String img;
  const MenuDrop({super.key, required this.text, required this.img});

  @override
  State<MenuDrop> createState() => _MenuDropState();
}

class _MenuDropState extends State<MenuDrop> {
  Color? hoverColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hoverColor = Colors.green;
          textColor = Colors.white;
        });
      },
      onExit: (event) {
        setState(() {
          hoverColor = Colors.white;
          textColor = Colors.black;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: hoverColor,
        child: Row(
          children: [
            Image.asset(widget.img),
            const SizedBox(
              width: 50,
            ),
            Text(
              widget.text,
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
