import 'package:flix_id_course/domain/entities/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;
  const TimeBookingPage(this.movieDetail, {super.key});

  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Container(
          child: const Center(
            child: Text("Test"),
          ),
        ),
      ),
    );
  }
}
