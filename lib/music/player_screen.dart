// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart' as ma;
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:mobile_music_player_lyrics/models/lyric.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:spotify/spotify.dart';
// import 'package:youtube_explode_dart/youtube_explode_dart.dart';

// class PlayerScreen extends ma.StatefulWidget {
//   const PlayerScreen({super.key});

//   @override
//   ma.State<PlayerScreen> createState() => _PlayerScreenState();
// }

// class _PlayerScreenState extends ma.State<PlayerScreen> {
//   String musicName = 'All Right Now';
//   String? musicArtist;
//   String? artistImage;
//   String? songImage;
//   String musicTrackId = '1gcESexgftSuLuML57Y69q';
//   String clientId = '0bcde75b952347b0b2f730d9d147fc22';
//   String clientSecret = 'c8f9e10ed9914d2395ef3f71b729b55e';
//   bool isLoading = false;
//   final audioPlayer = AudioPlayer();
//   List<Lyric> lyrics = [];
//   final ItemScrollController itemScrollController = ItemScrollController();
//   final ScrollOffsetController scrollOffsetController =
//       ScrollOffsetController();
//   final ItemPositionsListener itemPositionsListener =
//       ItemPositionsListener.create();
//   final ScrollOffsetListener scrollOffsetListener =
//       ScrollOffsetListener.create();
//   StreamSubscription? streamSubscription;
//   @override
//   void dispose() {
//     streamSubscription?.cancel();
//     super.dispose();
//   }

//   setUp() async {
//     setState(() {
//       isLoading = true;
//     });
//     final credentials = SpotifyApiCredentials(clientId, clientSecret);
//     final spotify = SpotifyApi(credentials);
//     await spotify.tracks.get(musicTrackId).then((track) async {
//       if (track.name != null) {
//         musicArtist = track.artists!.first.name;
//         songImage = track.album!.images!.first.url!.toString();
//         musicName = track.name!;
//         streamSubscription = audioPlayer.onPositionChanged.listen((duration) {
//           DateTime dt = DateTime(1970, 1, 1).copyWith(
//               hour: duration.inHours,
//               minute: duration.inMinutes.remainder(60),
//               second: duration.inSeconds.remainder(60));
//           if (lyrics.isNotEmpty) {
//             for (int index = 0; index < lyrics.length; index++) {
//               if (index > 4 && lyrics[index].timeStamp.isAfter(dt)) {
//                 itemScrollController.scrollTo(
//                     index: index - 3,
//                     duration: const Duration(milliseconds: 600));
//                 break;
//               }
//             }
//           }
//         });
//         setState(() {});
//         await http
//             .get(Uri.parse(
//                 "https://paxsenixofc.my.id/server/getLyricsMusix.php?q=$musicName $musicArtist&type=default"))
//             .then((res) {
//           String data = res.body;
//           lyrics = data
//               .split('\n')
//               .map((e) => Lyric(
//                   words: e.split(' ').sublist(1).join(' '),
//                   timeStamp: DateFormat("[mm:ss.SS]").parse(e.split(' ')[0])))
//               .toList();
//         });
//         setState(() {});
//         // artistImage = track.artists!.first.images!.first.url!;
//         print("ArtistName : $musicArtist");
//         print("SongImageUrl : $songImage");
//         print("SongArtistImage : $artistImage");
//         print("SongName : $musicName");
//         final yt = YoutubeExplode();
//         final result = await yt.search.search(track.name!);
//         final manifest =
//             await yt.videos.streamsClient.getManifest(result[0].id.value);
//         await audioPlayer.play(
//           UrlSource(manifest.audioOnly.first.url.toString()),
//         );
//         setState(() {});
//       }
//     });
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     setUp();
//   }

//   @override
//   ma.Widget build(ma.BuildContext context) {
//     return isLoading
//         ? const ma.Center(
//             child: ma.CircularProgressIndicator(),
//           )
//         : ma.Scaffold(
//             backgroundColor: ma.Colors.white,
//             body: ma.Column(
//               children: [
//                 ma.Image.network("$songImage"),
//                 ma.Text(musicArtist ?? ""),
//                 ma.Text(musicName),
//                 ma.ElevatedButton(
//                   onPressed: () async {
//                     if (audioPlayer.state == PlayerState.playing) {
//                       await audioPlayer.pause();
//                     } else {
//                       await audioPlayer.resume();
//                     }
//                   },
//                   child: null,
//                 ),
//                 ma.Expanded(
//                   child: ma.StreamBuilder<Duration>(
//                     stream: audioPlayer.onPositionChanged,
//                     builder: (context, snapshot) {
//                       return ScrollablePositionedList.builder(
//                         padding: const ma.EdgeInsets.only(left: 10),
//                         itemCount: lyrics.length,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           Duration duration =
//                               snapshot.data ?? const Duration(seconds: 0);
//                           DateTime dt = DateTime(1970, 1, 1).copyWith(
//                               hour: duration.inHours,
//                               minute: duration.inMinutes.remainder(60),
//                               second: duration.inSeconds.remainder(60));
//                           return ma.Text(
//                             lyrics[index].words,
//                             style: ma.TextStyle(
//                               color: lyrics[index].timeStamp.isAfter(dt)
//                                   ? ma.Colors.black
//                                   : ma.Colors.black.withOpacity(0.4),
//                             ),
//                           );
//                         },
//                         itemScrollController: itemScrollController,
//                         scrollOffsetController: scrollOffsetController,
//                         itemPositionsListener: itemPositionsListener,
//                         scrollOffsetListener: scrollOffsetListener,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
