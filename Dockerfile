#Download ubuntu
FROM ubuntu:18.04
#Run update
RUN apt-get update
#Enable add-apt
RUN apt-get -y install software-properties-common
#installing java 8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#Youtrack installation
RUN mkdir youtrack
COPY ./run.sh youtrack
WORKDIR youtrack/
RUN wget https://download.jetbrains.com/charisma/youtrack-2018.2.43142.jar
#Change permission
RUN chmod +x run.sh
EXPOSE 8080
