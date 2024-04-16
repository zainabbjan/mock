import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task1/core/constants/colors.dart';

import 'package:task1/core/constants/text_styles.dart';
import 'package:task1/core/models/posts_model.dart';
import 'package:task1/ui/screens/home/components/profile_drawer.dart';
import 'package:task1/ui/screens/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME, JESSICA',
          style: mediumTitle.copyWith(color: AppColors.white),
        ),
      ),
      drawer:const  ProfleDrawer(),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return ModalProgressHUD(
              inAsyncCall: state is HomeLoading,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (state is HomeLoaded)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.posts.length,
                          itemBuilder: (BuildContext context, int index) =>
                              postCard(state.posts[index], index, cubit),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  postCard(Posts post, index, cubit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title ?? ''),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: post.url ?? " ",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Liked by ${post.likeCount ?? 0}'),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    cubit.likeCountt(index);
                    // context.read<HomeCubit>().likeCountt(index);
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
