FROM debian
COPY ./* /
RUN chmod +x ./script.sh
CMD ["bash", "./script.sh"]
