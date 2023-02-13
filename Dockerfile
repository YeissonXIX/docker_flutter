FROM cirrusci/flutter:3.0.0

ENV ANDROID_SDK_TOOLS "9477386_latest" 

ENV ANDROID_BUILD_TOOLS "30.0.3" 

ENV ANDROID_COMPILE_SDK "31" 

WORKDIR /app

#Copia todos los archivos del proyecto a la imagen
COPY . . 

CMD ["flutter","build","apk","--split-per-abi"]
