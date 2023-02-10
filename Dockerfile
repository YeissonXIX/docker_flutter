FROM fischerscode/flutter
WORKDIR /app
VOLUME ./app:/app
COPY . . 
RUN flutter pub get
RUN flutter build apk --split-per-abi
