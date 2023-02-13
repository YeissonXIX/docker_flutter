FROM fischerscode/flutter:flutter-sudo:3.2.2
COPY . . 
RUN rm pubspec.lock
RUN flutter build apk --split-per-abi 
