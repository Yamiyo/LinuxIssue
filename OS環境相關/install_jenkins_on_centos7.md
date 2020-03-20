# intro
### install java
> yum install java-1.8.0-openjdk-devel

### install jenkins jar file for process
- import the GPG key
> curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

- add jeknins to yum repo
> sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

### install jenkins with `yum`
> yum install -yjenkins

### setup jenkins systemctl
> systemctl start jenkins

### check jenkins status
> systemctl status jenkins

### if there is a auto restart needed ... enable systemctl
> systemctl enable jenkins


# refer:
- https://linuxize.com/post/how-to-install-jenkins-on-centos-7/