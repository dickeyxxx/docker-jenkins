FROM dickeyxxx/base
MAINTAINER Jeff Dickey jeff@dickeyxxx.com

RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.549/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ADD run /usr/local/bin/run
RUN useradd -m jenkins

RUN mkdir /etc/service/jenkins
ADD run /etc/service/jenkins/run

CMD ["/sbin/my_init"]
EXPOSE 8080
