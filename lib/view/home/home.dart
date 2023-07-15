import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({super.key});

  @override
  State<MyAppHomePage> createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  String currencyValue = "Currencies option";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: AppColor.secondary,
              height: MediaQuery.of(context).size.height * 0.35,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.emoji_events_rounded,
                            color: Colors.white),
                        HorizontalSpace.bigSpace,
                        Expanded(
                            child: UIHelper.textFormFieldHelper(
                                labelText: "Search",
                                suffixIcon: const Icon(
                                  CupertinoIcons.search,
                                  color: AppColor.backgroundPrimary,
                                ))),
                        HorizontalSpace.bigSpace,
                        const Icon(CupertinoIcons.bell_solid,
                            color: Colors.white),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return UIHelper.draggableBottomSheet(
                              minChildSize: 0.3,
                              initialChildSize: 0.3,
                              context: context,
                              builder: (context, scrollController) {
                                return Stack(
                                  alignment: Alignment.topCenter,
                                  fit: StackFit.loose,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16))),
                                      child: ListView.builder(
                                        controller: scrollController,
                                        itemCount: AppData.currencies.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final currencyData = AppData
                                              .currencies
                                              .elementAt(index);
                                          return ListTile(
                                            title: UIHelper.textHelper(
                                                text: currencyData),
                                            onTap: () {
                                              if (currencyData.isEmpty) {
                                                return;
                                              } else {
                                                setState(() {
                                                  // Update the selected currency.
                                                  currencyValue = currencyData;
                                                });
                                              }
                                              // Close the bottom sheet.
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: AppColor.secondary,
                                          borderRadius: AppBorderRadius
                                              .circularBorderRadius),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UIHelper.textHelper(
                                text: currencyValue,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.white,
                                textSize: FontSize.fontSizeBigRegular),
                            HorizontalSpace.smallSpace,
                            const Icon(CupertinoIcons.arrow_2_circlepath_circle,
                                size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    UIHelper.currencyTextHelper(
                        price: 20000,
                        mainAxisAlignment: MainAxisAlignment.center,
                        currencyIcon: Icons.attach_money,
                        textSize: FontSize.fontSizeSuperHuge,
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.white),
                    VerticalSpace.smallSpace,
                    UIHelper.textHelper(
                        text: "Available Balance", textColor: AppColor.white),
                    VerticalSpace.regularSpace,
                    OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.creditcard,
                              color: AppColor.white,
                              size: 16,
                            ),
                            HorizontalSpace.smallSpace,
                            UIHelper.textHelper(
                                text: "Add Money", textColor: AppColor.white),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.backgroundPrimary,
                padding: const EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UIHelper.textHelper(
                            text: "Transaction",
                            textSize: FontSize.fontSizeTitle,
                            fontWeight: FontWeight.bold),
                        IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                    Expanded(
                      child: UIHelper.cardHelper(
                        childWidget: ListView.separated(
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                                thickness: 1,
                                color: AppColor.secondary.withOpacity(0.1)),
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemCount: AppData.transactions.length,
                          itemBuilder: (context, index) {
                            final transactionData =
                                AppData.transactions.elementAt(index);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColor.backgroundPrimary,
                                      child: Icon(transactionData['icon'],
                                          color: AppColor.successColor),
                                    ),
                                    HorizontalSpace.regularSpace,
                                    UIHelper.textHelper(
                                      text: transactionData['category'],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    UIHelper.currencyTextHelper(
                                        price: transactionData['amount'],
                                        textSize: FontSize.fontSizeBigRegular),
                                    IconButton(
                                        visualDensity:
                                            VisualDensity.adaptivePlatformDensity,
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: const Icon(Icons.arrow_forward_ios,
                                            size: 14)),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            child: _summaryCard()),
      ],
    );
  }

  Widget _summaryCard() {
    return Card(
      elevation: 0,
      color: AppColor.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(),
            icon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                children: [
                  const Icon(CupertinoIcons.money_dollar_circle_fill,
                      size: 32, color: AppColor.secondary),
                  VerticalSpace.smallSpace,
                  UIHelper.textHelper(text: "Send")
                ],
              ),
            ),
          ),
          UIHelper.verticalDivider(),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(),
            icon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                children: [
                  const Icon(Icons.autorenew_rounded,
                      size: 32, color: AppColor.successColor),
                  VerticalSpace.smallSpace,
                  UIHelper.textHelper(text: "Request")
                ],
              ),
            ),
          ),
          UIHelper.verticalDivider(),
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(),
            icon: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                children: [
                  const Icon(Icons.account_balance_rounded,
                      size: 32, color: AppColor.warnColor),
                  VerticalSpace.smallSpace,
                  UIHelper.textHelper(text: "Bank")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}