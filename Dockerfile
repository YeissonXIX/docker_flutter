FROM fischerscode/flutter:3.3.2
COPY . . 
RUN flutter build apk --split-per-abi
