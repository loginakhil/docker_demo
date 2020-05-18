# base image
FROM alpine:3.9.6 as build_stage

# set a working directory
WORKDIR /app

# install required tools
RUN apk update 
RUN apk add g++ wget

# download dependencies 
RUN wget https://github.com/nlohmann/json/releases/download/v3.7.3/include.zip
RUN unzip include.zip

# copy source code
COPY main.cpp /app

# build your application
RUN g++ -std=c++17 -static -Iinclude main.cpp -lstdc++fs -o main.exe

# final container
FROM alpine:3.9.6 

# copy application build
COPY --from=build_stage /app/main.exe /bin/main.exe

# start the application
CMD /bin/main.exe