FROM cirrusci/flutter:3.0.0
COPY . . 
RUN rm pubspec.lock
RUN flutter build apk --split-per-abi 
