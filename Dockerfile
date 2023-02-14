FROM cirrusci/flutter:3.0.0

ENV ANDROID_SDK_TOOLS "9477386_latest" 

ENV ANDROID_BUILD_TOOLS "30.0.3" 

ENV ANDROID_COMPILE_SDK "31" 

WORKDIR /app
#Installing Android SDK and donwloading missing components
RUN mkdir -p Android/sdk

ENV ANDROID_SDK_ROOT Android/sdk

RUN mkdir -p .android && touch .android/repositories.cfg

RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-$ANDROID_SDK_TOOLS.zip

RUN unzip sdk-tools.zip && rm sdk-tools.zip

RUN mkdir -p Android/sdk/tools && mv ./cmdline-tools/bin Android/sdk/tools/

RUN cd Android/sdk/tools/bin/

RUN yes | sdkmanager --licenses

RUN sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}"
RUN sdkmanager "platform-tools"
RUN sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}"
RUN sdkmanager "sources;android-${ANDROID_COMPILE_SDK}"

ENV PATH "$PATH:$ANDROID_SDK_ROOT/tools"
ENV PATH "$PATH:$ANDROID_SDK_ROOT/tools/bin"
ENV PATH "$PATH:$ANDROID_SDK_ROOT/platform-tools"
#Copia todos los archivos del proyecto a la imagen
COPY . . 

CMD ["flutter","build","apk","--split-per-abi"]
