FROM fischerscode/flutter:3.3.2
WORKDIR /app
VOLUME ./app:/app
COPY . . 
RUN flutter --version
RUN flutter pub get
RUN flutter build apk --split-per-abi
