import 'package:flix_id_course/domain/entities/movie_detail.dart';
import 'package:flix_id_course/domain/entities/result.dart';
import 'package:flix_id_course/domain/entities/transaction.dart';
import 'package:flix_id_course/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id_course/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_id_course/presentation/extensions/build_context_extentions.dart';
import 'package:flix_id_course/presentation/extensions/int_extension.dart';
import 'package:flix_id_course/presentation/misc/constant.dart';
import 'package:flix_id_course/presentation/misc/method.dart';
import 'package:flix_id_course/presentation/pages/booking_confirmation_page/method/transaction_row.dart';
import 'package:flix_id_course/presentation/providers/router/router_provider.dart';
import 'package:flix_id_course/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:flix_id_course/presentation/providers/usecase/create_transaction_provider.dart';
import 'package:flix_id_course/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id_course/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id_course/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookingConfirmationWidget extends ConsumerWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const BookingConfirmationWidget({
    super.key,
    required this.transactionDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var (movieDetail, transaction) = transactionDetail;
    transaction = transaction.copyWith(
      total: transaction.ticketAmount! * transaction.ticketPrice! +
          transaction.adminFee,
    );

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              24,
              24,
              40,
            ),
            child: Column(
              children: [
                BackNavigationBar(
                  "Booking Confirmation",
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 48,
                  height: (MediaQuery.of(context).size.width - 48) * 0.6,
                  borderRadius: 15,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}",
                  fit: BoxFit.cover,
                ),
                verticalSpace(24),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpace(5),
                const Divider(
                  color: ghostWhite,
                ),
                verticalSpace(5),
                transactionRow(
                  title: "Showing date",
                  value: DateFormat("EEEE, d MMMM, y").format(
                      DateTime.fromMillisecondsSinceEpoch(
                          transaction.watchingTime ?? 0)),
                  width: MediaQuery.of(context).size.width - 48,
                ),
                transactionRow(
                  title: "Theater",
                  value: "${transaction.theaterName}",
                  width: MediaQuery.of(context).size.width - 48,
                ),
                transactionRow(
                  title: "Seat numbers",
                  value: transaction.seats.join(", "),
                  width: MediaQuery.of(context).size.width - 48,
                ),
                transactionRow(
                  title: "# Of ticket",
                  value: "${transaction.ticketAmount} ticket(s)",
                  width: MediaQuery.of(context).size.width - 48,
                ),
                transactionRow(
                  title: "Ticket price",
                  value: "${transaction.ticketPrice?.toIDRCurrencyFormat()}",
                  width: MediaQuery.of(context).size.width - 48,
                ),
                transactionRow(
                  title: "Adm. fee",
                  value: transaction.adminFee.toIDRCurrencyFormat(),
                  width: MediaQuery.of(context).size.width - 48,
                ),
                const Divider(
                  color: ghostWhite,
                ),
                transactionRow(
                  title: "Total",
                  value: transaction.total.toIDRCurrencyFormat(),
                  width: MediaQuery.of(context).size.width - 48,
                ),
                verticalSpace(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      int transactionTime =
                          DateTime.now().millisecondsSinceEpoch;
                      var transactionCreate = transaction.copyWith(
                          transactionTime: transactionTime,
                          id: "flx-$transactionTime-${transaction.uuid}");
                      CreateTransaction createTransaction =
                          ref.read(createTransactionProvider);
                      var result = await createTransaction(
                          CreateTransactionParam(
                              transaction: transactionCreate));
                      if (!context.mounted) return;
                      switch (result) {
                        case Success(value: _):
                          ref
                              .read(transactionDataProvider.notifier)
                              .refreshTransactionData();
                          ref
                              .read(userDataProvider.notifier)
                              .refreshUserData();
                          ref.read(routerProvider).goNamed("main");
                        case Failed(:final message):
                          context.showSnackBar(message);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: saffron,
                        foregroundColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text("Pay Now"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
