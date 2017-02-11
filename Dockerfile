FROM alpine:3.5

# Update the packages
RUN apk update &&\
    apk upgrade &&\
    apk add bash bash-doc bash-completion

COPY build/build.sh build.sh
RUN bash build.sh

# Copy the ansible.cfg file that will include the vendor files
COPY .ansible.cfg /root/.ansible.cfg
COPY modules/* /modules/

ENTRYPOINT /bin/zsh
