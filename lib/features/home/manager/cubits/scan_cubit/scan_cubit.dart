import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanCubitInitial());
  static ScanCubit get(context) => BlocProvider.of(context);

  String scanResult = "";
  Future<void> scanQR() async {
    try {
      // await FlutterBarcodeScanner.scanBarcode(
      //         "#2A99CF", "Cancel", true, ScanMode.QR)
      //     .then((value) {
      //   if (value == "123456mmshf") {
      //     scanResult = value;
      //     emit(ScanningSuccess(cartId: value));
      //   }
      // });
      emit(ScanningSuccess(cartId: "123456mmshf"));
    } catch (e) {
      emit(ScanningError(error: 'Unable to read QR code'));
    }
  }
}
