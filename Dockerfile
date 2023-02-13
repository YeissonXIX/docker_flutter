FROM cirrusci/flutter:3.0.0
WORKDIR /app
COPY . . 
CMD ["flutter","build","apk","--split-per-abi"]
