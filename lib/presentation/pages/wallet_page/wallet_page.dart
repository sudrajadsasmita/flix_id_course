import 'package:flix_id_course/presentation/misc/method.dart';
import 'package:flix_id_course/presentation/pages/wallet_page/methods/recent_transaction.dart';
import 'package:flix_id_course/presentation/pages/wallet_page/methods/wallet_card.dart';
import 'package:flix_id_course/presentation/providers/router/router_provider.dart';
import 'package:flix_id_course/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
            child: Column(
              children: [
                BackNavigationBar(
                  "My Wallet",
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                walletCard(ref),
                verticalSpace(24),
                ...recentTransaction(ref),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
