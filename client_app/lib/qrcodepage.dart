import 'package:client_app/functions/qr_funcs.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  QRCodePage(this.subID, this.userID);
  final int subID, userID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("QR Code"),
        ),
        body: FutureBuilder<String>(
            future: GenerateQRCode(subID, userID),
            builder: (BuildContext context, AsyncSnapshot<String> qrData) {
              return qrData.data != null
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QrImage(
                          data: qrData.data.toString(),
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                        const Text("Show this code to scanner of gate")
                      ],
                    ))
                  : const Text("Creating QR Code");
            }));
  }
}
