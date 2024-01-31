import 'package:find_sport_task/bloc/clubs_ads/clubs_ads_bloc.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_request.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  static void showErrorDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Xatolik'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay!'),
            ),
          ],
        );
      },
    );
  }

  static void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Xatolik'),
          content: Text('Iltimos, Tilni tanlang!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay!'),
            ),
          ],
        );
      },
    );
  }

  static void showClubsAdsDialog(
      ClubsAdsRequest request, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(request.title!),
          content: Text(
              '${request.lat!.toStringAsFixed(4)}\n${request.lot!.toStringAsFixed(4)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay!'),
            ),
          ],
        );
      },
    );
  }

  static void showLoadingDialog(ClubsAdsState state, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return SizedBox(
          width: 100,
          child: AlertDialog(
            title: const CircularProgressIndicator(),
            actions: [
              TextButton(
                onPressed: () {
                  if (state is ClubsAdsSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Okay!'),
              ),
            ],
          ),

        );
      },
    );
  }
}
