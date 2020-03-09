import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_bloc/Api/api.dart';
import 'package:youtube_bloc/models/video.dart';

class VideoBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  final StreamController<String> _searchController = StreamController<String>();

  Stream get outVideos => _videosController.stream;
  Sink get intSeach => _searchController.sink;

  VideoBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _videosController.sink.add([]);
      videos = await api.search(search);
    } else {
      videos += await api.nextPage();
    }
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videosController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }
}
