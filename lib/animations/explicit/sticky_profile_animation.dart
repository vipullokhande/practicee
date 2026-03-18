// import 'package:flutter/material.dart';

// class StickyProfileAnimation extends StatelessWidget {
//   const StickyProfileAnimation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffd1d9e1),
//       body: CustomScrollView(
//         reverse: true,
//         slivers: [
//           _buildChatGroup("Anuj", Colors.orange, 15),
//           _buildChatGroup("Elon Musk", Colors.green, 10),
//           _buildChatGroup("Sameer Ray", Colors.blue, 12),
//         ],
//       ),
//     );
//   }

//   Widget _buildChatGroup(String name, Color color, int count) {
//     return SliverMainAxisGroup(
//       slivers: [
//         // The Sticky Avatar Header
//         SliverPersistentHeader(
//           pinned: true,
//           delegate: GroupAvatarDelegate(name: name, color: color),
//         ),
//         // The Messages
//         SliverPadding(
//           padding: const EdgeInsets.only(left: 65, right: 10, bottom: 20),
//           sliver: SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) => MessageBubble(
//                 text:
//                     "Message $index from $name. Check the sidebar avatar behavior.",
//                 color: color,
//               ),
//               childCount: count,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class GroupAvatarDelegate extends SliverPersistentHeaderDelegate {
//   final String name;
//   final Color color;

//   GroupAvatarDelegate({required this.name, required this.color});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // This is where the magic happens.
//     // The avatar stays at 'bottom: 0' of the header's constraints.
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Positioned(
//           left: 10,
//           // This keeps the icon visible at the bottom of the group's "active" area
//           bottom: 10,
//           child: CircleAvatar(
//             radius: 20,
//             backgroundColor: color,
//             child: Text(
//               name[0],
//               style: const TextStyle(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => 40.0; // Height of the avatar area
//   @override
//   double get minExtent => 40.0;
//   @override
//   bool shouldRebuild(covariant GroupAvatarDelegate oldDelegate) => false;
// }

// class MessageBubble extends StatelessWidget {
//   final String text;
//   final Color color;
//   const MessageBubble({super.key, required this.text, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
//       ),
//       child: Text(text),
//     );
//   }
// }
import 'package:flutter/material.dart';

class StickyProfileAnimation extends StatefulWidget {
  const StickyProfileAnimation({super.key});

  @override
  State<StickyProfileAnimation> createState() => _StickyProfileAnimationState();
}

class _StickyProfileAnimationState extends State<StickyProfileAnimation> {
  final ScrollController _mainController = ScrollController();
  final ScrollController _avatarController = ScrollController();

  static const _groups = [
    ("Sameer Ray", Color(0xFF5B8CDB), 12),
    ("Elon Musk", Color(0xFF4CAF50), 10),
    ("Anuj", Color(0xFFFF9800), 15),
  ];

  // ✅ itemH = vertical margin(3*2) + vertical padding(8*2) + text height(16) = 38
  // Add a bit of buffer → 42 works reliably for single-line messages
  static const double _kItemH = 42.0;
  static const double _kGroupSpacing = 12.0;

  @override
  void initState() {
    super.initState();
    _mainController.addListener(() {
      if (_avatarController.hasClients) {
        _avatarController.jumpTo(_mainController.offset);
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  double _groupH(int count) => count * _kItemH + _kGroupSpacing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd1d9e1),
      body: Stack(
        children: [
          // ── Layer 1: Messages ─────────────────────────────────────────────
          CustomScrollView(
            controller: _mainController,
            reverse: true,
            slivers: [
              for (final (name, color, count) in _groups)
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 54,
                    right: 10,
                    bottom: _kGroupSpacing,
                  ),
                  sliver: SliverList.builder(
                    itemCount: count,
                    itemBuilder: (_, i) => _MessageBubble(
                      text: "Message $i from $name",
                      // ✅ reverse:true → i==count-1 is at visual BOTTOM = last in group
                      isLastInGroup: i == count - 1,
                    ),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
            ],
          ),

          // ── Layer 2: Sticky avatars ───────────────────────────────────────
          IgnorePointer(
            child: CustomScrollView(
              controller: _avatarController,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                for (final (name, color, count) in _groups)
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _AvatarDelegate(
                          name: name,
                          color: color,
                          // ✅ maxH = full group height
                          // avatar starts beside last message (visual bottom)
                          maxH: _groupH(count),
                          // ✅ minH = one item height
                          // avatar sticks beside last visible message when scrolling
                          minH: _kItemH,
                        ),
                      ),
                    ],
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarDelegate extends SliverPersistentHeaderDelegate {
  final String name;
  final Color color;
  final double maxH;
  final double minH;

  const _AvatarDelegate({
    required this.name,
    required this.color,
    required this.maxH,
    required this.minH,
  });

  @override
  double get maxExtent => maxH;

  @override
  double get minExtent => minH;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // ✅ reverse:true → last message (count-1) is at visual BOTTOM
    // Avatar at bottom-left = beside last message of group
    // When sticky: stays at bottom of visible header = beside last visible msg
    return Stack(
      children: [
        Positioned(
          left: 6,
          bottom: 4,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: color,
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant _AvatarDelegate old) =>
      old.name != name ||
      old.color != color ||
      old.maxH != maxH ||
      old.minH != minH;
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isLastInGroup;

  const _MessageBubble({
    super.key,
    required this.text,
    required this.isLastInGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
          // ✅ pointed corner only on last message
          bottomLeft: Radius.circular(isLastInGroup ? 3 : 12),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 1),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}
