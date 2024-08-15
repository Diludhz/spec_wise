import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> sendOtpEmail(String recipientEmail, String otp) async {
  String username = 'c2compare@gmail.com'; // Replace with your email
  String password =
      'compare2compare'; // Replace with your email password or app password

  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username, 'Your App Name')
    ..recipients.add(recipientEmail)
    ..subject = 'Your OTP Code'
    ..text = 'Your OTP code is $otp';

  try {
    await send(message, smtpServer);
    print('OTP sent to $recipientEmail');
  } on MailerException catch (e) {
    print('Failed to send OTP: $e');
  }
}
