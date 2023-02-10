FROM fischerscode/flutter:3.3.2
RUN rm pubspec.lock
COPY . . 
RUN flutter build apk --split-per-abi
