import 'package:flix_id_course/presentation/misc/method.dart';
import 'package:flix_id_course/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref) => [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          image: DecorationImage(
            image: ref.watch(userDataProvider).asData?.value?.photoUrl != null
                ? NetworkImage(
                        ref.watch(userDataProvider).asData!.value!.photoUrl!)
                    as ImageProvider
                : const AssetImage(
                    "assets/pp-placeholder.png",
                  ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      verticalSpace(20),
      Text(
        ref.watch(userDataProvider).asData?.value?.name ?? "",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        ref.watch(userDataProvider).asData?.value?.email ?? "",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ];
