FROM debian
COPY ./* /
RUN chmod +x ./script.sh
RUN bash ./script.sh
