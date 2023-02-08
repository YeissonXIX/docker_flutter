FROM cirrusci/flutter
WORKDIR /app
COPY . . 
RUN flutter build apk --split-per-abi
