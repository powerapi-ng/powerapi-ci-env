# PowerAPI Continuous Integration Environement

List of docker image used for powerapi CI : 

- `Dockerfile-powerapi-base-ci`: file used to build the powerapi/powerapi-base-ci image. Used for all powerapi CI jobs
- `Dockerfile-powerapi-build-deb`: file used to build the powerapi/powerapi-build-deb image. Used to build powerapi deb package
- `Dockerfile-hwpc-sensor-build`: file used to build the powerapi/hwpc-sensor-build image. Used to build hwpc-sensor

Debian Package : 

- `python3-thespian_3.10.0-1_all.deb`: thespian debian package. Required dependency when installing powerapi
