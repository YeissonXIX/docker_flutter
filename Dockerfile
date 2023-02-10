FROM fischerscode/flutter:3.3.2
RUN ls -a
COPY . . 
RUN flutter build apk --split-per-abi
