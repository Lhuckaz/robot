FROM ubuntu:latest

ENV VERSAO_JAVA=8
ENV VERSAO_MAVEN=3.6.3
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
ENV MAVEN_HOME=/opt/maven
ENV CHROMEDRIVER=110.0.5481.30

RUN apt-get update && apt-get install -y git wget curl software-properties-common openjdk-${VERSAO_JAVA}-jdk openjdk-${VERSAO_JAVA}-jre unzip gettext nano vim
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install google-chrome-stable -y
RUN wget "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER}/chromedriver_linux64.zip"
RUN unzip chromedriver_linux64.zip -d /usr/bin
RUN wget --no-verbose -O /tmp/apache-maven-${VERSAO_MAVEN}-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/${VERSAO_MAVEN}/binaries/apache-maven-${VERSAO_MAVEN}-bin.tar.gz && tar xzf /tmp/apache-maven-${VERSAO_MAVEN}-bin.tar.gz -C /opt/ && ln -s /opt/apache-maven-${VERSAO_MAVEN} /opt/maven && ln -s /opt/maven/bin/mvn /usr/local/bin  &&  rm -f /tmp/apache-maven-${VERSAO_MAVEN}-bin.tar.gz