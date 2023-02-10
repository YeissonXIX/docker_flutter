FROM cirrusci/flutter
WORKDIR /app
VOLUME ./app:/app
COPY . . 
RUN flutter build apk --split-per-abi
