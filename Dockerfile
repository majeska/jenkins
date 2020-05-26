ARG version
FROM jenkins/jenkins:$version

# set initial default admin username and password
COPY scripts/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# prevent jobs from running on the master
#COPY scripts/executors.groovy /usr/share/jenkins/ref/init.groovy.d/

# skip initial setup wizard
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
