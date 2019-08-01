FROM timberio/docker-client as docker-client

FROM ubuntu:latest as installer

COPY --from=docker-client /usr/local/bin/docker /usr/local/bin/docker

ENV http_proxy=http://10.235.76.130:8080
ENV HTTP_PROXY=http://10.235.76.130:8080
ENV https_proxy=http://10.235.76.130:8080
ENV HTTPS_PROXY=http://10.235.76.130:8080

RUN apt-get update && apt-get -y install zsh git wget curl

# run the installation script
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
FROM alpine:3.10.1
COPY --from=installer /root /root
COPY --from=installer /bin/zsh /bin/zsh

# preserve history
RUN mkdir /zsh_history/ && touch /zsh_history/.zsh_history && ln -s  /zsh_history/.zsh_history /root/.zsh_history
WORKDIR /root
COPY .zshrc /root/.zshrc
#aliases
COPY functions.sh /root/functions.sh
RUN chmod +x /root/functions.sh
# start zsh
CMD [ "/bin/zsh" ]

#alias omz="docker run --rm -it -v omz_history:/zsh_history/ -v /var/run/docker.sock:/var/run/docker.sock omz"
