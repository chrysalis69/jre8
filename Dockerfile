FROM chrysalis69:busybox
MAINTAINER stefan.coetzee@uct.ac.za

ADD https://busybox.net/downloads/binaries/ssl_helper-x86_64 /sbin/ssl_helper
RUN chmod a+x /sbin/ssl_helper
RUN ( wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jre.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u73-b02/server-jre-8u73-linux-x64.tar.gz &&   gunzip /tmp/jre.tar.gz && mkdir /opt && cd /opt && tar xf /tmp/jre.tar && rm /tmp/jre.tar && mv /opt/jdk*/jre /opt/jre && rm -rf /opt/jdk* )
RUN for cmd in $(find /opt/jre/bin/*) ; do cd /bin ; ln -s $cmd ; done
ENV JAVA_HOME /opt/jre
