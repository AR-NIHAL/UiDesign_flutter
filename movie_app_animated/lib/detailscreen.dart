import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';
import 'package:animate_do/animate_do.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height * 0.61,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Image.network(widget.movie.image, fit: BoxFit.cover),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Transform.translate(offset: Offset(0, 1,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
