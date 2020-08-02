FROM alpine

RUN apk upgrade --update && \ 
	apk add bash curl zip unzip openjdk8
RUN rm /bin/sh && \
	ln -s /bin/bash /bin/sh

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.bashrc" && \
	sdk install kotlin && sdk install kscript
RUN ln -s $HOME/.sdkman/candidates/kotlin/current/bin/kotlinc /usr/bin/kotlinc && \
	ln -s $HOME/.sdkman/candidates/kotlin/current/bin/kotlin /usr/bin/kotlin && \
	ln -s $HOME/.sdkman/candidates/kscript/current/bin/kscript /usr/bin/kscript

ENTRYPOINT ["kscript"]
