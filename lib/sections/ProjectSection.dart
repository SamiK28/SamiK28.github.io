import 'package:flutter/material.dart';

import 'package:Portfolio/app/app.dart';
import 'package:Portfolio/services/Services.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
            children: projects
                .map((project) => ProjectItem(
                      technology: project["tech"],
                      name: project["name"],
                      desc: project["desc"],
                      url: project["url"],
                      achievement: project["achievement"],
                      type: project["type"],
                    ))
                .toList()),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String? technology;
  final String? name;
  final String? desc;
  final String? url;
  final String? achievement;
  final String? type;

  const ProjectItem({
    this.technology,
    this.name,
    this.desc,
    this.url,
    this.achievement,
    this.type,
  });

  bool get _hasUrl => (url ?? "").trim().isNotEmpty;
  bool get _isGithubUrl => _hasUrl && url!.toLowerCase().contains("github.com");
  bool get _hasAchievement => (achievement ?? "").trim().isNotEmpty;
  bool get _isResearchPaper =>
      (type ?? "").trim().toLowerCase() == "research paper";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: _isResearchPaper ? null : const Color(0xFF202022),
        gradient: _isResearchPaper
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3B4048),
                  Color(0xFF2F343D),
                  Color(0xFF252A31),
                ],
                stops: [0.0, 0.35, 1.0],
              )
            : null,
        border: _isResearchPaper
            ? Border.all(color: const Color(0xFFE3E8F1), width: 1.4)
            : null,
        boxShadow: _isResearchPaper
            ? const [
                BoxShadow(
                  color: Color(0x4DE3E8F1),
                  blurRadius: 18,
                  spreadRadius: 0.5,
                  offset: Offset(0, 0),
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: InkWell(
        onTap: _hasUrl ? () => Services().launchURL(url: url!.trim()) : null,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.02,
            MediaQuery.of(context).size.height * 0.04,
            MediaQuery.of(context).size.width * 0.02,
            MediaQuery.of(context).size.height * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isResearchPaper)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF505764),
                        Color(0xFF383E47),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFFE3E8F1)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40E3E8F1),
                        blurRadius: 10,
                        spreadRadius: 0.2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.science_rounded,
                        color: Color(0xFFEFF3F9),
                        size: 15,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Published Research Paper",
                        style: TextStyle(
                          color: Color(0xFFF4F7FC),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                technology ?? "",
                style: TextStyle(
                  color:
                      _isResearchPaper ? const Color(0xFFEFF3FA) : Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name ?? "",
                    style: TextStyle(
                      fontSize: 32,
                      color: _isResearchPaper
                          ? const Color(0xFFF7FAFF)
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                  if (_hasUrl)
                    Image.asset(
                      "assets/icons/link.png",
                      color: Colors.white,
                      height: 24,
                      width: 24,
                    )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              Text(
                desc ?? "",
                softWrap: true,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: _isResearchPaper
                      ? const Color(0xFFDDE3EC)
                      : const Color(0xFFa1a1a1),
                  fontSize: 16,
                ),
              ),
              if (_hasAchievement)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.emoji_events_rounded,
                        color: const Color(0xFFFFD700),
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                      ),
                      Expanded(
                        child: Text(
                          achievement!.trim(),
                          style: const TextStyle(
                            color: Color(0xFFFFD700),
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              if (_isGithubUrl)
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/github.png",
                          color: Colors.white,
                          height: 18,
                          width: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                        ),
                        Text(
                          "Github",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
