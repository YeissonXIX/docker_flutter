FROM cirrusci/flutter:3.0.0
COPY . . 
CMD ["flutter build apk","--split-per-abi"] 
