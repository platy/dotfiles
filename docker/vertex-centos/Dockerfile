FROM centos 

RUN yum-config-manager --add-repo https://packages.relayr.io/windriver-stage/relayr.repo
RUN yum --disablerepo=base --disablerepo=extras --disablerepo=updates makecache
RUN yum install -y relayr-dsk

