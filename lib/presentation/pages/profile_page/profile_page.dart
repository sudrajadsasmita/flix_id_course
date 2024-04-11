import 'package:flix_id_course/presentation/misc/method.dart';
import 'package:flix_id_course/presentation/pages/profile_page/method/profile_item.dart';
import 'package:flix_id_course/presentation/pages/profile_page/method/user_info.dart';
import 'package:flix_id_course/presentation/providers/router/router_provider.dart';
import 'package:flix_id_course/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              verticalSpace(20),
              ...userInfo(ref),
              verticalSpace(20),
              const Divider(),
              verticalSpace(20),
              profileItem('Update profile'),
              verticalSpace(20),
              profileItem(
                'My Wallet',
                onTap: () => ref.read(routerProvider).pushNamed("wallet"),
              ),
              verticalSpace(20),
              profileItem('Change Password'),
              verticalSpace(20),
              profileItem('Change Language'),
              verticalSpace(20),
              const Divider(),
              verticalSpace(20),
              profileItem('Contact Us'),
              verticalSpace(20),
              profileItem('Privacy Policy'),
              verticalSpace(20),
              profileItem('Terms and Condition'),
              verticalSpace(60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                  child: const Text("Logout"),
                ),
              ),
              verticalSpace(20),
              const Text(
                "0.0.1",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              verticalSpace(100),
            ],
          ),
        ),
      ],
    );
  }
}
