FROM cirrusci/flutter
COPY . . 
RUN rm pubspec.lock
RUN flutter build apk --split-per-abi 
