import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chip_component.dart';
import 'custom_text_component.dart';
import 'richtext_component.dart';

class BookingComponent extends StatelessWidget {
  String bookingId;
  String bookingDate;
  String bookingStatus;
  String service;
  String serviceDuration;
  String scheduleDate;
  String scheduleTime;
  bool isDispute;
  BookingComponent({
    super.key,
    this.bookingId = '',
    this.bookingDate = '',
    this.bookingStatus = '',
    this.isDispute = false,
    this.service = '',
    this.serviceDuration = '',
    this.scheduleDate = '',
    this.scheduleTime = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: isDispute == true
            ? null
            : const LinearGradient(
                colors: Styles.blackGradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        border: isDispute != true
            ? null
            : Border.all(
                color: Styles.slightGreyBorder.withOpacity(0.25), width: 1),
        boxShadow: isDispute != true
            ? null
            : [
                BoxShadow(
                    color: Styles.black.withOpacity(0.06),
                    offset: const Offset(8, 9),
                    blurRadius: 22,
                    spreadRadius: 0)
              ],
        color: isDispute == true ? Styles.white : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextWidget(
                    text: "Booking ID",
                    color: isDispute == true ? Styles.black : Styles.white,
                    onTapColor: Styles.solidOrange,
                    onTapText: bookingId,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w700,
                    onTapFontSize: 14,
                    onTapFontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  CustomTextWidget(
                    text: "Booking Date $bookingDate",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Styles.greySilver,
                  )
                ],
              ),
              ChipComponent(
                  padding: const EdgeInsets.only(
                      left: 9, right: 9, bottom: 6, top: 6),
                  borderRadius: 5,
                  text: isDispute == true ? "Pending" : bookingStatus,
                  color: (bookingStatus == "Pending")
                      ? Styles.orange
                      : (bookingStatus == "Completed")
                          ? Styles.solidGreen
                          : (bookingStatus == "Scheduled")
                              ? Styles.blueLight
                              : (bookingStatus == "Cancelled")
                                  ? Styles.solidRed
                                  : Styles.solidGrey.withOpacity(0.1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontColor:
                      isDispute == true ? Styles.solidGrey : Styles.white),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Service",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
              CustomTextWidget(
                text: service,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Service Duration",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
              CustomTextWidget(
                text: serviceDuration,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Schedule Date",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
              CustomTextWidget(
                text: scheduleDate,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: "Schedule Time",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
              CustomTextWidget(
                text: scheduleTime,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isDispute == true ? Styles.black : Styles.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
