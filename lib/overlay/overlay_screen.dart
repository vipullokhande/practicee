import 'package:flutter/material.dart';

class OverLayScreen extends StatefulWidget {
  const OverLayScreen({super.key});

  @override
  State<OverLayScreen> createState() => _OverLayScreenState();
}

class _OverLayScreenState extends State<OverLayScreen> {
  List<String> names = [];
  OverlayEntry? overlayEntry;
  bool ignore = true;
  final LayerLink layerLink = LayerLink();
  // final focusNode = FocusNode();
  createOverlay() {
    final rb = context.findRenderObject() as RenderBox;
    final size = rb.size;
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
    assert(overlayEntry == null);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 75),
          child: StatefulBuilder(
            builder: (context, state) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state(() {
                          if (names.contains('GONE')) {
                            names.remove('GONE');
                          } else {
                            names.add('GONE');
                          }
                        });
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: names.contains('GONE')
                          ? BoxDecoration(
                              color: const Color.fromARGB(255, 4, 217, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 0,
                                color: Colors.transparent,
                              ),
                            )
                          : null,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'GONE',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: names.contains('GONE')
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state(() {
                          if (names.contains('NOT')) {
                            names.remove('NOT');
                          } else {
                            names.add('NOT');
                          }
                        });
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: names.contains('NOT')
                          ? BoxDecoration(
                              color: const Color.fromARGB(255, 4, 217, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 0,
                                color: Colors.transparent,
                              ),
                            )
                          : null,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'NOT',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: names.contains('NOT')
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        state(() {
                          if (names.contains('ERA')) {
                            names.remove('ERA');
                          } else {
                            names.add('ERA');
                          }
                        });
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: names.contains('ERA')
                          ? BoxDecoration(
                              color: const Color.fromARGB(255, 4, 217, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 0,
                                color: Colors.transparent,
                              ),
                            )
                          : null,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'ERA',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: names.contains('ERA')
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }

  hideOverlay() {
    setState(() {});
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ignore) {
          hideOverlay();
          setState(() {
            ignore = false;
          });
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 200,
            ),
            CompositedTransformTarget(
              link: layerLink,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    ignore = true;
                  });
                  createOverlay();
                },
                child: IgnorePointer(
                  ignoring: ignore,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    height: 65,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(20),
                      border: !ignore
                          ? Border.all(width: 0)
                          : Border.all(
                              width: 2,
                              color: Colors.blue,
                            ),
                    ),
                    child: const Text(
                      'Select Category',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14).copyWith(
                top: 10,
                left: 25,
              ),
              child: SizedBox(
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < names.length; i++)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 4, 217, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 0,
                                color: Colors.transparent,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text(names[i]),
                                const Icon(Icons.done),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
