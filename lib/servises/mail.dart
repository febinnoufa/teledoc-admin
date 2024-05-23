import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  final String username;
  final String password;

  EmailService(this.username, this.password);

  Future<void> sendEmail(String recipient, String subject, String body) async {
    final smtpServer = SmtpServer('smtp.your-email-provider.com',
        username: username,
        password: password,
        // Consider adding tls and other settings here
    );

    final message = Message()
      ..from = Address(username, 'Teledoc')
      ..recipients.add(recipient)
      ..subject = subject
      ..text = body;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n${e.toString()}');
    }
  }
}
