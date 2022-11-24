FROM centos:7

RUN yum -y update; yum clean all
RUN yum install -y sudo
RUN yum install -y wget
RUN yum -y install systemd; yum clean all; 


VOLUME ["/sys/fs/cgroup"]


# install sshd
RUN yum install -y epel-release

RUN yum install -y openssh-server \
&& sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& echo 'root:P@ssw0rd' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN yum install -y openssh-clients

RUN yum update -y
RUN yum install -y iptables


RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io

#locale: unsupported locale setting (리눅스 locale 설정) // 파이썬3.9설치하면 yum이 사라짐
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
ENV LC_ALL=en_US.UTF-8


#파이썬 3.9설치 // 심볼릭링크
RUN yum update -y
RUN sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel \
    && wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz  \
    && tar xzf Python-3.9.6.tgz  \
    && sudo rm Python-3.9.6.tgz \
    && cd Python-3.9.6 \
    && sudo ./configure \
    && sudo ./configure --enable-optimizations \
    && sudo yum install -y make \
    && sudo make altinstall  \
    && rm -rf /usr/bin/python \ 
    && ln -s /usr/local/bin/python3.9 /usr/bin/python


RUN pip3.9 install --upgrade --ignore-installed pip setuptools
RUN pip3.9 install ansible

WORKDIR /root
COPY ./Dockerfile ./Dockerfile

EXPOSE 22

ENTRYPOINT ["/sbin/init", "systemctl", "start", "sshd"]

#CMD ["systemctl", "start", "sshd"]