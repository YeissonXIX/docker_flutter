FROM cirrusci/flutter:3.0.0
WORKDIR /app
#Installing Android SDK
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mkdir -p Android/sdk/tools && mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin
RUN yes | ./sdkmanager --licenses
RUN ./sdkmanager "build-tools;30.0.3" "patcher;v4" "platform-tools" "platforms;android-31" "sources;android-31"
ENV PATH "$PATH:$ANDROID_SDK_ROOT/platform-tools"
#Copia todos los archivos del proyecto a la imagen
COPY . . 

CMD ["flutter","build","apk","--split-per-abi"]
