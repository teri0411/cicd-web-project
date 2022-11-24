########## docker-server #################
FROM centos:7
#FROM centos:8

RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all;
# (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
# rm -f /lib/systemd/system/multi-user.target.wants/*;\
# rm -f /etc/systemd/system/*.wants/*;\
# rm -f /lib/systemd/system/local-fs.target.wants/*; \
# rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
# rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
# rm -f /lib/systemd/system/basic.target.wants/*;\
# rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME ["/sys/fs/cgroup"]

# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo
Run yum update

# install sshd
RUN yum install -y epel-release
RUN yum install -y openssh-server \
&& sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
&& echo 'root:P@ssw0rd' | chpasswd \
&& ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN yum install -y openssh-clients

RUN yum update -y
RUN yum install -y iptables
# RUN yum install -y docker docker-registry
# RUN yum install -y docker
# RUN yum install -y docker-ce-cli 
# RUN yum install -y containerd.io
# RUN sed -i -e 's/overlay2/vfs/g' /etc/sysconfig/docker-storage

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io
# RUN systemctl start docker
RUN yum install -y ncurses
RUN yum install -y git

WORKDIR /root
COPY ./Dockerfile ./Dockerfile

EXPOSE 22

ENTRYPOINT ["/sbin/init", "systemctl", "start", "sshd"]