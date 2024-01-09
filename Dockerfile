#FROM ubuntu:20.04
#RUN apt-get update -y && apt-get install alsa-lib mpg123 -y
#RUN apt-get update && \
#    apt-get install -y alsa-utils pulseaudio && \
#    #apt-get install -y alsaplayer  libasound2 && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
#WORKDIR /app
#COPY Moye_Moye.mp3 /app/moye_moye.mp3
#RUN mkdir -p /home/music/.config/pulse
#RUN useradd music
#RUN chown -R music:music /home/music/.config/pulse &&  usermod -aG pulse-access music
#COPY asound.conf /etc/asound.conf

#ENV DISPLAY=:0
#CMD ["alsaplayer", "/app/moye_moye.mp3"]

FROM ubuntu:latest

# Install the mpg123 audio player
RUN apt-get update && apt-get install -y mpg123

# Set up a non-root user
RUN useradd -ms /bin/bash user
USER user

# Copy your favorite song into the container
COPY moye.mp3 /home/user/

# Set the default command to play the audio file
CMD ["mpg123", "/home/user/moye.mp3"]
