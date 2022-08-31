import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicSheet extends StatefulWidget {
  final String trackUrl;
  final String imgUrl;
  final String title;
  final String description;
  final Function pause;
  final Function play;

  const MusicSheet(
      {Key? key,
      required this.trackUrl,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.pause,
      required this.play})
      : super(key: key);

  @override
  State<MusicSheet> createState() => _MusicSheetState();
}

class _MusicSheetState extends State<MusicSheet> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.all(0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                height: 735,
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  widget.imgUrl == ""
                      ? Container()
                      : Image.network(
                          widget.imgUrl,
                          width: 200,
                          height: 200,
                        ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isPlay) {
                          widget.pause;
                          isPlay = false;
                        } else {
                          widget.play;
                          isPlay = true;
                        }
                      });
                    },
                    child: isPlay
                        ? const Icon(
                            Icons.pause_circle_filled,
                            size: 40,
                          )
                        : const Icon(
                            Icons.play_circle_fill,
                            size: 40,
                          ),
                  )
                ]))));
  }
}
