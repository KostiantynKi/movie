import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  int index;

  MovieDetailsScreen({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.titleMedium;
    var styleBodyMedium = Theme.of(context).textTheme.bodyMedium;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: 500,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    movie.bgPictureUrl ??
                        "https://demofree.sirv.com/nope-not-here.jpg",
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 54,
              child: SizedBox(
                height: 55,
                width: 55,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Transform.scale(
                        scale: 1.2,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ))),
              ),
            ),
            Positioned(
              left: 20,
              top: 254,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  height: MediaQuery.of(context).size.height - 350,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 200.0),
                        TitleReleaseYearDescription(
                            size: size,
                            style: style,
                            styleBodyMedium: styleBodyMedium),
                        const SizedBox(height: 24.0),
                        GenresRatingDuration(
                            size: size,
                            style: style,
                            styleBodyMedium: styleBodyMedium),
                        const SizedBox(height: 4.0),
                        Directors(
                            size: size,
                            style: style,
                            styleBodyMedium: styleBodyMedium),
                        // Text('Director: ${movie.directors}', style: style),
                        const SizedBox(height: 8.0),
                        Writers(
                            size: size,
                            style: style,
                            styleBodyMedium: styleBodyMedium),
                        const SizedBox(height: 8.0),

                        Stars(
                            size: size,
                            style: style,
                            styleBodyMedium: styleBodyMedium),
                        const SizedBox(height: 80.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: Container(
                color: Colors.black,
                height: 110,
                // height: MediaQuery.of(context).size.height - 560,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18.0),
                          Text('iMDb ratting', style: styleBodyMedium),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color.fromRGBO(233, 141, 75, 1),
                              ),
                              Text(
                                '${movie.imdbRating}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                ' /10',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 70,
                        width: 240,
                        padding:
                            const EdgeInsets.only(right: 18, left: 18, top: 18),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                'Watch trailer',
                                style: styleBodyMedium,
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 120.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget GenresRatingDuration({var size, var style, var styleBodyMedium}) {
    return SizedBox(
      width: size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 14,
            child: SizedBox(
                height: 20,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    movie.genres?.length ?? 0,
                    (index) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          " ${movie.genres?[index].title}",
                          style: styleBodyMedium,
                        ),
                        if (index < movie.genres!.length - 1)
                          Text(
                            ', ',
                            style: styleBodyMedium,
                          ),
                      ],
                    ),
                  ),
                )),
          ),
          Flexible(
            flex: 1,
            child: Align(
                alignment: Alignment.center, child: Text('  l ', style: style)),
          ),
          Flexible(
            flex: 4,
            child: Align(
                alignment: Alignment.center,
                child: Text('${movie.mpaRating}', style: styleBodyMedium)),
          ),
          Flexible(
            flex: 1,
            child: Align(
                alignment: Alignment.center, child: Text(' l ', style: style)),
          ),
          Flexible(
            flex: 5,
            child: Align(
                alignment: Alignment.center,
                child: Text(' ${movie.duration} min', style: styleBodyMedium)),
          ),
        ],
      ),
    );
  }

  Widget TitleReleaseYearDescription(
      {var size, var style, var styleBodyMedium}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${movie.title}',
            style: const TextStyle(
              fontFamily: 'KronaOne',
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            )),
        const SizedBox(height: 4.0),
        Text('(${movie.releaseYear})',
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Text('${movie.description}',
              style: const TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  Widget Directors({var size, var style, var styleBodyMedium}) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
            child: Text("Directors:", style: style),
          ),
        ),
        Flexible(
          flex: 4,
          child: SizedBox(
            width: size.width,
            height: 18,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                movie.directors?.length ?? 0,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${movie.directors?[index].firstName} ${movie.directors?[index].lastName}",
                      style: styleBodyMedium,
                    ),
                    if (index < movie.directors!.length - 1)
                      Text(
                        ', ',
                        style: styleBodyMedium,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Writers({var size, var style, var styleBodyMedium}) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
            child: Text("Writers: ", style: style),
          ),
        ),
        Flexible(
          flex: 5,
          child: SizedBox(
            width: size.width,
            height: 18,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                movie.writers?.length ?? 0,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${movie.writers?[index].firstName} ${movie.writers?[index].lastName}",
                      style: styleBodyMedium,
                    ),
                    if (index < movie.writers!.length - 1)
                      Text(
                        ', ',
                        style: styleBodyMedium,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Stars({var size, var style, var styleBodyMedium}) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Stars:  ", style: style),
          ),
        ),
        Flexible(
          flex: 7,
          child: SizedBox(
            width: size.width,
            height: 18,
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                movie.stars?.length ?? 0,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      " ${movie.stars?[index].firstName} ${movie.stars?[index].lastName}",
                      style: styleBodyMedium,
                    ),
                    if (index < movie.stars!.length - 1)
                      Text(
                        ', ',
                        style: styleBodyMedium,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
