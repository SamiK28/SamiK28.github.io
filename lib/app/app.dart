import 'dart:convert';
import 'package:Portfolio/services/sizes.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Portfolio/PageSwitcher/PageSwitcher.dart';
import 'package:Portfolio/sections/ProjectSection.dart';
import 'package:Portfolio/sections/WorkExperienceSection.dart';
import 'package:Portfolio/services/Services.dart';

List projects = [];
List workex = [];
Map<String, String> hyperlinks = {};
int active = 1;

const String appVersion = '2.0.0';
const String appBuildDate = '2026-02-22';

Future<void> loadPortfolioData() async {
  print('\n🚀 Portfolio App v$appVersion (Build: $appBuildDate)');
  print('═' * 50);
  try {
    // Try to fetch from GitHub
    final response = await http.get(
      Uri.parse('https://raw.githubusercontent.com/SamiK28/SamiK28.github.io/master/assets/data.json'),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 10));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      projects = jsonData['projects'];
      workex = jsonData['workex'];
      hyperlinks = Map<String, String>.from(jsonData['hyperlinks']);
      print('✓ Loaded data from GitHub');
      return;
    }
  } catch (e) {
    print('⚠ GitHub fetch failed: $e');
  }
  
  // Fallback 1: Try to load from local assets
  try {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    projects = jsonData['projects'];
    workex = jsonData['workex'];
    hyperlinks = Map<String, String>.from(jsonData['hyperlinks']);
    print('✓ Loaded data from local assets');
    return;
  } catch (e) {
    print('⚠ Local assets fallback failed: $e');
  }
  
  // Fallback 2: Hardcoded defaults (emergency backup)
  projects = [
    {
      "name": "Pigeon",
      "tech": "Flutter",
      "desc": "Multi-Platform Messaging Application with an inbuilt chatbot.",
      "url": "https://github.com/SamiK28/Pigeon"
    },
    {
      "name": "SecureIT",
      "tech": "Flutter, Python / OpenCV",
      "desc": "A product that ensures your home is safe from intruders using face recognition algorithm.",
      "url": "https://github.com/SamiK28/secure-it"
    },
  ];
  workex = [
    {
      "name": "Xpert",
      "role": "Mobile Application Development Intern",
      "url": "https://play.google.com/store/apps/details?id=chat.xpert.user",
    },
  ];
  hyperlinks = {
    "github": "https://github.com/SamiK28",
    "linkedin": "https://www.linkedin.com/in/samarthkhanna28/",
    "twitter": "https://twitter.com/samarthkhanna28",
    "instagram": "https://www.instagram.com/samarthkhanna28/",
    "resume": "https://drive.google.com/file/d/1JfbLFxHQJ5QGgGyuFTVsMX8loL2A9-n8/view",
    "mail": "mailto:samarthkhanna24@gmail.com"
  };
  print('✓ Loaded hardcoded fallback data');
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  @override
  void initState() {
    super.initState();
    loadPortfolioData().then((_) {
      setState(() {});
    });
  }

  static Widget subHeader = Text(
      "Mobile Application and Backend Developer. I am not only a developer but an active consumer as well, I like to read about upcoming technological ventures, as a result, I also love participating in Hackathons.",
      style: TextStyle(
        color: Color(0xFFa1a1a1),
        fontSize: 18,
      ));

  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  @override
  Widget build(BuildContext context) {
    DeviceSize().size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
          ),
          controller: _scrollController,
          shrinkWrap: true,
          children: [
            Text(
              "Hello, ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "I'm Samarth Khanna",
                  speed: Duration(milliseconds: 100),
                  textStyle: TextStyle(
                      color: Colors.orange.shade900,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                ),
              ],
              repeatForever: false,
              isRepeatingAnimation: false,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
            ),
            subHeader,
            Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
            ),
            TopNavbar(
              items: [
                "GitHub",
                "Twitter",
                "LinkedIn",
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: PageSwitcher(
                titles: ["projects", "work experience"],
                onUpdate: () {
                  setState(() {});
                },
              ),
            ),
            Container(
                child:
                    (active == 1) ? ProjectsSection() : WorkExperienceSection()),
            Padding(padding: EdgeInsets.only(top: 60)),
            VersionWidget(),
          ],
        ),
      ),
    );
  }
}

class VersionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Text(
          'v$appVersion • Build $appBuildDate',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class BackDrop extends StatelessWidget {
  final text;
  final size;
  final strokeWidth;

  BackDrop({
    required this.text,
    required this.size,
    required this.strokeWidth,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = Color(0xFF0c0c0c),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class TopNavbar extends StatelessWidget {
  final List<String> items;

  const TopNavbar({required this.items}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: items
                .map(
                  (elem) => Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Services()
                            .launchURL(url: hyperlinks[elem.toLowerCase()]!);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white38),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/${elem.toLowerCase()}.png",
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                              ),
                            ),
                            Text(
                              elem,
                              style: TextStyle(
                                color: Color(0xFFe8e6e3),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await Services().launchURL(url: hyperlinks["resume"]!);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  width: 140,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Resume",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/link.png",
                        color: Colors.black,
                        height: 24,
                        width: 24,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                " or  ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                    ),
                    SelectableText(
                      "samarthkhanna24@gmail.com",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
