FROM alpine
ENV ALA="to sierotka"
ENTRYPOINT [ "sh", "-c", "echo $ALA" ]