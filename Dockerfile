FROM meyskens/desktop-base:latest

RUN apt-get update && apt-get install -y \
        curl \
	apt-transport-https \
	gpg \
	git \
    sudo

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&\
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&\
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get install -y code

CMD sudo -u user code --verbose

