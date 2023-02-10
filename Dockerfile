FROM fischerscode/flutter:3.3.2
COPY . . 
RUN rm pubspec.lock
RUN flutter build apk --split-per-abi
