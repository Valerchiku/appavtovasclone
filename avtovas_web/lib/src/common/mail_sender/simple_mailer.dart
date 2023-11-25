import 'dart:async';
import 'dart:convert';
import 'package:universal_html/html.dart' as html;

// final String host;
//   final int port;
//   final bool ignoreBadCertificate;
//   final bool ssl;
//   final bool allowInsecure;
//   final String? username;
//   final String? password;
//   final String? xoauth2Token;

//   SmtpServer(this.host,
//       {this.port = 587,
//       String? name,
//       this.ignoreBadCertificate = false,
//       this.ssl = false,
//       this.allowInsecure = false,
//       this.username,
//       this.password,
//       this.xoauth2Token});

class SimpleMailer {
  String host;
  int port;
  bool ssl;
  String? username;
  String? password;

  SimpleMailer(
    this.host, {
    this.port = 587,
    this.ssl = false,
    this.username,
    this.password,
  });

  Future<void> sendMail(String to, String subject, String message) async {
    try {
      
      final socket = html.WebSocket('ws${ssl ? 's' : ''}://$host:$port');

      await socket.onOpen.first;

      // CoreLogger.infoLog(socket.)

      // await _sendCommand(socket, 'EHLO');
      // await _sendCommand(socket, 'AUTH LOGIN');
      // await _sendCommand(socket, base64Encode(utf8.encode(username ?? '')));
      // await _sendCommand(socket, base64Encode(utf8.encode(password ?? '')));

      // await _sendCommand(socket, 'MAIL FROM:<$username>');
      // await _sendCommand(socket, 'RCPT TO:<$to>');

      // await _sendCommand(socket, 'DATA');
      _sendCommand(socket, 'EHLO');
      _sendCommand(socket, 'AUTH LOGIN');
      _sendCommand(socket, base64Encode(utf8.encode(username ?? '')));
      _sendCommand(socket, base64Encode(utf8.encode(password ?? '')));
      printSmth();
      _sendCommand(socket, 'MAIL FROM:<$username>');
      _sendCommand(socket, 'RCPT TO:<$to>');

      _sendCommand(socket, 'DATA');
      // socket.sendString('Subject: $subject\r\n\r\n$message\r\n.\r\n');
      socket.sendString('Subject: $subject\r\n\r\n$message\r\n.\r\n');

      _sendCommand(socket, 'QUIT');

      socket.close();

      // ('ws${ssl ? 's' : ''}://$host:$port')
      // var socket = await Socket.connect(host, port);

      //   final stream = socket.
      //     .transform(utf8.decoder as StreamTransformer<Uint8List, dynamic>)
      //     ..transform(
      //       const LineSplitter(),
      //     );

      //   if (ssl) {
      //     socket = await SecureSocket.secure(socket);
      //   }

      //   // Login
      //   await _sendCommand(socket, stream, 'EHLO');
      //   await _sendCommand(socket, stream, 'AUTH LOGIN');
      //   await _sendCommand(
      //     socket,
      //     stream,
      //     base64Encode(
      //       utf8.encode(
      //         username ?? '',
      //       ),
      //     ),
      //   );
      //   await _sendCommand(
      //     socket,
      //     stream,
      //     base64Encode(
      //       utf8.encode(
      //         password ?? '',
      //       ),
      //     ),
      //   );

      //   // Set the sender
      //   await _sendCommand(socket, stream, 'MAIL FROM:<${username}>');

      //   // Set the recipient
      //   await _sendCommand(socket, stream, 'RCPT TO:<${to}>');

      //   // Send the email content
      //   await _sendCommand(socket, stream, 'DATA');
      //   socket.add(utf8.encode('Subject: $subject\r\n\r\n$message\r\n.\r\n'));

      //   // Quit
      //   await _sendCommand(socket, stream, 'QUIT');

      //   await socket.close();
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> _sendCommand(
  //     Socket socket, Stream stream, String command) async {
  //   socket.add(utf8.encode('$command\r\n'));
  //   await socket.flush();

  //   var response = await stream.first;

  //   if (!response.startsWith('2') && !response.startsWith('3')) {
  //     throw Exception('Server did not respond as expected: $response');
  //   }
  // }

  // Future<void> _sendCommand(html.WebSocket socket, String command) async {
  //   socket.sendString('$command\r\n');

  //   final response = await socket.onMessage.first;

  //   CoreLogger.infoLog(
  //     'Response',
  //     params: response.data,
  //   );

  //   final statusCode = int.parse(
  //     response.data.toString().substring(0, 3),
  //   );

  //   if (statusCode >= 200 && statusCode < 300) {
  //     print('Command "$command" successful: $response');
  //   } else if (statusCode >= 300 && statusCode < 400) {
  //     print('Command "$command" requires further action: $response');
  //   } else if (statusCode >= 400 && statusCode < 500) {
  //     print('Command "$command" failed temporarily: $response');
  //   } else if (statusCode >= 500 && statusCode < 600) {
  //     print('Command "$command" failed permanently: $response');
  //   } else {
  //     print('Unknown status code: $response');
  //   }

  //   // WebSocket does not have a direct response mechanism like a Socket, so you might need to handle the response based on your SMTP server's behavior.
  // }
}

Future<void> _sendCommand(html.WebSocket socket, String command) async {
  print('data');
  socket.sendString('$command\r\n');

  await socket.onOpen.first; // Wait for the connection to open

  final completer = Completer<void>();

  final subscription = socket.onMessage.listen((html.MessageEvent event) {
    print('Received response: ${event.data}');

    final statusCode = int.parse(event.data.toString().substring(0, 3));

    if (statusCode >= 200 && statusCode < 300) {
      print('Command "$command" successful: ${event.data}');
    } else if (statusCode >= 300 && statusCode < 400) {
      print('Command "$command" requires further action: ${event.data}');
    } else if (statusCode >= 400 && statusCode < 500) {
      print('Command "$command" failed temporarily: ${event.data}');
    } else if (statusCode >= 500 && statusCode < 600) {
      print('Command "$command" failed permanently: ${event.data}');
    } else {
      print('Unknown status code: ${event.data}');
    }

    completer.complete(); // Notify that the response is processed
  });

  await completer.future; // Wait for the response processing to complete

  await subscription.cancel(); // Cancel the subscription to avoid memory leaks
}

Future<void> printSmth() async {
  print('data');
}
