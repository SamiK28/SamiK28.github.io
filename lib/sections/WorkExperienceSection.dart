import 'package:flutter/material.dart';
import 'package:Portfolio/app/app.dart';
import 'package:Portfolio/services/Services.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  List<_WorkItem> _parseWorkItems() {
    return workex
        .map(
          (item) => _WorkItem(
            name: (item["name"] ?? "").toString(),
            role: (item["role"] ?? "").toString(),
            url: (item["url"] ?? "").toString(),
            summary: (item["summary"] ?? "").toString(),
          ),
        )
        .toList();
  }

  List<_CompanyGroup> _groupByCompany(List<_WorkItem> items) {
    final List<_CompanyGroup> groups = [];
    final Map<String, int> groupIndexByKey = {};

    for (final item in items) {
      final key = item.name.trim().toLowerCase();
      if (groupIndexByKey.containsKey(key)) {
        groups[groupIndexByKey[key]!].roles.add(item);
      } else {
        groupIndexByKey[key] = groups.length;
        groups.add(
          _CompanyGroup(
            companyName: item.name.trim(),
            roles: [item],
          ),
        );
      }
    }

    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final groups = _groupByCompany(_parseWorkItems());
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children:
            groups.map((group) => _CompanyTimelineCard(group: group)).toList(),
      ),
    );
  }
}

class _CompanyTimelineCard extends StatelessWidget {
  final _CompanyGroup group;

  const _CompanyTimelineCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 900;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding:
          EdgeInsets.fromLTRB(isCompact ? 16 : 22, 16, isCompact ? 16 : 22, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E222B),
            Color(0xFF171A22),
          ],
        ),
        border: Border.all(
          width: 1.2,
          color: const Color(0xFF59647A).withValues(alpha: 0.5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2F6E7D98),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.companyName,
            style: TextStyle(
              fontSize: isCompact ? 24 : 30,
              color: const Color(0xFFF4F6FB),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x0098A4BA),
                  Color(0xB298A4BA),
                  Color(0x0098A4BA),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(
            group.roles.length,
            (index) => _TimelineRoleItem(
              item: group.roles[index],
              isLast: index == group.roles.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineRoleItem extends StatelessWidget {
  final _WorkItem item;
  final bool isLast;

  const _TimelineRoleItem({
    required this.item,
    required this.isLast,
  });

  bool get _hasUrl => item.url.trim().isNotEmpty;
  bool get _hasSummary => item.summary.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final roleContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF232834),
        borderRadius: BorderRadius.circular(14),
        border:
            Border.all(color: const Color(0xFF5A6782).withValues(alpha: 0.55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.role,
                  style: const TextStyle(
                    color: Color(0xFFF2F6FF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (_hasUrl)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D3544),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: const Color(0xFF6D7A95)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/playstore.png",
                        color: const Color(0xFFDFE5F2),
                        height: 14,
                        width: 14,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "View",
                        style: TextStyle(
                          color: Color(0xFFDCE2EE),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (_hasSummary) ...[
            const SizedBox(height: 9),
            Text(
              item.summary,
              style: const TextStyle(
                color: Color(0xFFB9C3D5),
                fontSize: 13,
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: _hasUrl
                ? () => Services().launchURL(url: item.url.trim())
                : null,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: roleContent,
            ),
          ),
          if (!isLast)
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 6, bottom: 6),
              child: Container(
                width: 2,
                height: 20,
                color: const Color(0xFF59647B),
              ),
            ),
        ],
      ),
    );
  }
}

class _CompanyGroup {
  final String companyName;
  final List<_WorkItem> roles;

  _CompanyGroup({
    required this.companyName,
    required this.roles,
  });
}

class _WorkItem {
  final String name;
  final String role;
  final String url;
  final String summary;

  _WorkItem({
    required this.name,
    required this.role,
    required this.url,
    required this.summary,
  });
}
