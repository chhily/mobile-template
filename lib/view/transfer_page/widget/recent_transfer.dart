import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/transfer_page/widget/transfer_process.dart';

class RecentTransferWidget extends StatelessWidget {
  const RecentTransferWidget({super.key, required this.transferData});
  final List<TransferModel> transferData;

  @override
  Widget build(BuildContext context) {
    return UIHelper.cardHelper(
        color: AppColor.white,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace.regularSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: UIHelper.textFormFieldHelper(
                        textColor: Colors.black,
                        labelText: "Search ``example@gmail.com`` ",
                        suffixIcon: const Icon(CupertinoIcons.search,
                            color: AppColor.contentDisable),
                        fillColor: AppColor.backgroundInfo.withOpacity(0.1),
                        enableColor: AppColor.secondary),
                  ),
                  VerticalSpace.bigSpace,
                  UIHelper.textHelper(
                      text: "Most Recent",
                      textSize: FontSize.fontSizeBigRegular),
                ],
              ),
            ),
            Expanded(
                child: _buildRecentTransferList(transferData: transferData)),
          ],
        ));
  }

  Widget _buildRecentTransferList({required List<TransferModel> transferData}) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final transferValue = transferData.elementAt(index);
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TransferProcessPage(transferValue: transferValue),
                  ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
              child: Row(
                children: [
                  UIHelper.imageAvatarHelper(transferValue.receiverImage),
                  HorizontalSpace.regularSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.textHelper(text: transferValue.receiverName),
                        UIHelper.textHelper(
                            text: transferValue.receiverEmail,
                            textSize: FontSize.fontSizeMedium),
                      ],
                    ),
                  ),
                  UIHelper.currencyTextHelper(
                      price: transferValue.receiverMoney,
                      currencySymbol: transferValue.receiverCurrencySymbol,
                      iconColor: AppColor.errorColor,
                      textColor: AppColor.errorColor),
                ],
              ),
            ),
          );
        },
        itemCount: AppData.transferData.length);
  }
}