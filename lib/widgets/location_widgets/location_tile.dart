import 'package:flutter/material.dart';
import 'package:pocket_peja/controller/get_travel_time.dart';
import 'package:pocket_peja/screen/main_screens/expanded_location_tile.dart';
import 'package:pocket_peja/controller/data_album.dart';
import 'package:provider/provider.dart';
import 'package:pocket_peja/provider_data.dart';

class LocationTile extends StatefulWidget {
  //'https://media-cdn.tripadvisor.com/media/photo-s/09/10/4f/fd/kulla-e-zenel-beut.jpg'
  final String locationName;
  final double originLat;
  final double originLong;
  final double destLat;
  final double destLong;
  final String heroTag;
  final String firstImageUrl;
  final String secondImageUrl;
  final String thirdImageUrl;
  final String expandableTileDescription;
  final int offSet;

  const LocationTile(
      {required this.locationName,
      required this.originLat,
      required this.originLong,
      required this.destLat,
      required this.destLong,
      required this.heroTag,
      required this.firstImageUrl,
      required this.secondImageUrl,
      required this.thirdImageUrl,
      required this.expandableTileDescription,
      required this.offSet});

  @override
  State<LocationTile> createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile>
    with SingleTickerProviderStateMixin {
  late Future<Album> futureAlbum;
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    /// Getting [API] data from [futureAlbum]
    print('Getting Album started...');
    futureAlbum = _getData();
    print('Getting Album Done...');

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _colorTween = _animationController.drive(
      ColorTween(
        begin: const Color(0xFF2BCE5A),
        end: const Color(0xFF69B8D4),
      ),
    );
    _animationController.repeat();
    super.initState();
  }

  Future<Album> _getData() async {
    return await GetTravelTime(
            originLat: widget.originLat,
            originLong: widget.originLong,
            destLat: widget.destLat,
            destLong: widget.destLong,
            travelMode: TravelMode.walking)
        .fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            String time = snapshot.data!.locationTime;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandedTile(
                      title: widget.locationName,
                      description: widget.expandableTileDescription,
                      firstImgUrl: widget.firstImageUrl,
                      secondImgUrl: widget.secondImageUrl,
                      thirdImgUrl: widget.thirdImageUrl,
                      time: 5,
                      imgTag: widget.heroTag,
                      originLat: widget.originLat,
                      originLong: widget.originLong,
                      destLat: widget.destLat,
                      destLong: widget.destLong,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.heroTag,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            //Here goes the same radius, u can put into a var or function
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2.5,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              width: size.width,
                              height: size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.firstImageUrl),
                                alignment: Alignment(
                                    0,
                                    -context.read<Data>().pageOffset.abs() +
                                        (widget.offSet == 0
                                            ? 1
                                            : widget.offSet)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0.5),
                      child: Text(
                        widget.locationName,
                        style: const TextStyle(fontSize: 12.5),
                      ),
                    ),
                    Text(
                      'Minutes away: $time',
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.none ||
              snapshot.hasError) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandedTile(
                      title: widget.locationName,
                      description: widget.expandableTileDescription,
                      firstImgUrl: widget.firstImageUrl,
                      secondImgUrl: widget.secondImageUrl,
                      thirdImgUrl: widget.thirdImageUrl,
                      time: 5,
                      imgTag: widget.heroTag,
                      originLat: widget.originLat,
                      originLong: widget.originLong,
                      destLat: widget.destLat,
                      destLong: widget.destLong,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.heroTag,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            //Here goes the same radius, u can put into a var or function
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2.5,
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              width: size.width,
                              height: size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.firstImageUrl),
                                alignment: Alignment(
                                    0,
                                    -context.read<Data>().pageOffset.abs() +
                                        (widget.offSet == 0
                                            ? 1
                                            : widget.offSet)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0.5),
                      child: Text(
                        widget.locationName,
                        style: const TextStyle(fontSize: 12.5),
                      ),
                    ),
                    const Text(
                      'Minutes away: Data not found',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
              width: size.width / 2,
              height: size.width / 2,
              child: CircularProgressIndicator(
                valueColor: _colorTween,
              ),
            );
          }
        });
  }
}
