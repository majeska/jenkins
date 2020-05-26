# Jenkins
Jenkins Docker Build

### Builds
Manual Builds: Update .env with build number and/or jenkins tag to build from.
Automated Builds: Your build machine export the following environment variables:
export BUILD=<build number>
export VERSION=<version>

### Jenkins Default Username and Password
On your build machine:
export JENKINS_USER=<your username> 
export JENKINS_PASS=<your password>
