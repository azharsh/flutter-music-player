import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/bloc/music_event.dart';
import 'package:flutter_music_player/bloc/music_state.dart';
import 'package:just_audio/just_audio.dart';
import '../bloc/music_bloc.dart';
import '../di/injection_container.dart';
import '../repository/repository.dart';
import 'music_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MusicBloc musicBloc;
  final filterController = TextEditingController();

  String trackUrl = "";
  String imgUrl = "";
  String title = "";
  String description = "";

  final player1 = AudioPlayer();

  void pausePlayer() async {
    print("pause");
     player1.pause();
  }

  void playPlayer() async {
     player1.play();
  }

  void playAudio(String songUrl) async {
    final duration = await player1.setUrl(songUrl);
    await player1.setLoopMode(LoopMode.one);
    player1.play();
  }

  @override
  void initState() {
    super.initState();
    musicBloc = MusicBloc(repository: sl<Repository>());
  }

  @override
  void dispose() {
    super.dispose();

    filterController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                    controller: filterController,
                    onChanged: onSearchTextChanged,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4, left: 12),
                      filled: true,
                      fillColor: Colors.grey,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search Song",
                    ),
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.black54,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: BlocProvider(
                        create: (_) => musicBloc,
                        child: BlocBuilder<MusicBloc, MusicState>(
                            builder: (_, state) {
                          if (state is Loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is Loaded) {
                            return ListView.builder(
                                itemCount: state.listMusic?.results.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var itemData =
                                      state.listMusic!.results[index];
                                  return Container(
                                      padding: const EdgeInsets.all(8),
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              trackUrl = itemData.previewUrl!;
                                              imgUrl = itemData.artworkUrl100!;
                                              title = itemData.trackName!;
                                              if(itemData.shortDescription != null) {
                                                description =
                                                itemData.shortDescription!;
                                              }

                                              playAudio(itemData.previewUrl!);
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Image.network(
                                                itemData.artworkUrl100!,
                                                width: 75,
                                                height: 100,
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  itemData.trackName == null
                                                      ? Container()
                                                      : SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            itemData.trackName!,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                  Text(itemData.artistName!)
                                                ],
                                              )
                                            ],
                                          )));
                                });
                          } else {
                            return const Center(
                              child: Text(
                                "No Result Found",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                        })))
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.10,
            minChildSize: 0.10,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: MusicSheet(
                  trackUrl: trackUrl,
                  imgUrl: imgUrl,
                  title: title,
                  description: description,
                  pause: pausePlayer,
                  play: playPlayer,
                ),
              );
            },
          ),
        ],
      )),
    );
  }

  onSearchTextChanged(String text) async {
    if (text.isEmpty) {
      setState(() {});
      return;
    } else {
      musicBloc.add(GetMusic(text));
      print(text);
      setState(() {});
    }
  }
}
