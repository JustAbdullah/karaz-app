import 'dart:io';

checkInternets() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
  } on SocketException catch (_) {}
}
