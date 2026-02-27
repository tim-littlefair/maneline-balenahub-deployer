## maneline-balenahub-deployer

Maneline is an application which serves a web user interface
to control and investigate the capabilities of some ranges
of modelling guitar amplifiers sold (currently and formerly)
by Fender Musical Instruments Corporation (FMIC).

This repository acts as a wrapper for the sibling 
[Maneline](https://github.com/tim-littlefair/maneline)
project repository to allow Maneline to be published 
as a balenaHub example application.

Maneline is a multi-platform project which needs a Java .jar 
file to be built to run natively on the Linux/macOS 
development host as well as the Balena infrastructure target.

It is not possible to publish to balenaHub directly from 
Maneline's primary repository as the publication process
for balenaHub requires all build steps to be implemented 
under Dockerfile and/or docker-compose.xml files in the 
root directory of the source repository.  

In order to implement the pre-docker build steps, and also
to allow the build files consumed by Docker to be kept 
out of the root directory in the primary repository, 
this wrapper has been created, which downloads a zip file
stored as an artifact of primary repository releases.
