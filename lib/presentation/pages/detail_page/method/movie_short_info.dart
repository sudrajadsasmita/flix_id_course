import 'package:flix_id_course/domain/entities/movie_detail.dart';
import 'package:flix_id_course/presentation/misc/method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo({
  required AsyncValue<MovieDetail?> asyncMovieDetail,
  required BuildContext context,
}) =>
    [
      Row(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpace(5),
          SizedBox(
            width: 95,
            child: Text("${asyncMovieDetail.when(
              data: (movieDetail) =>
                  movieDetail != null ? movieDetail.runtime : "-",
              error: (error, stackTrace) => "-",
              loading: () => "Loading...",
            )} minutes"),
          ),
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/genre.png'),
          ),
          horizontalSpace(5),
          SizedBox(
            width:
                MediaQuery.of(context).size.width - 48 - 95 - 14 - 14 - 5 - 5,
            child: asyncMovieDetail.when(
              data: (movieDrtail) {
                String genres = movieDrtail?.genres.join(', ') ?? "-";
                return Text(
                  genres,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                );
              },
              error: (error, stackTrace) => const Text(
                "-",
                style: TextStyle(fontSize: 12),
              ),
              loading: () => const Text(
                "Loading...",
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
      verticalSpace(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: Image.asset("assets/star.png"),
          ),
          horizontalSpace(5),
          Text(
            (asyncMovieDetail.asData?.value?.voteAverage ?? 0).toStringAsFixed(1),
          )
        ],
      ),
    ];
