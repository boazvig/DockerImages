# DockerImages


installation of https://github.com/uzh-rpg/agile_autonomy using docker 



1. Dockerfile.ros.noetic - installs ros noetic binary for ubuntu 20.04
2. Dockerfile.ros.noetic.cmake - installs cmake 3.22 from soucre code for Dockerfile.ros.noetic - needed for open3d 
3. Dockerfile.ros.noetic.open3d - installs open3d from source for Dockerfile.ros.noetic.cmake
4. Dockerfile.ros.noetic.agile - installs agile from source for Dockerfile.ros.noetic.open3d 





important installation remarks:


1. Open3D should be v0.9.0 for agile - to be tested
2. git clone --recursive -b 'v0.9.0' (do not foget recursive :))
3. agile contains some more compilation error :
3. 1 includes path to open3d instead of Open3D - fixed locally
3. 2 compilation error for rviz visualization error - could be bacause of wrong open3d version - should be checked


Building Docker.ros.noetic :

sudo docker build . -f Dockerfile.ros.noetic -t ros_noetic_20.04:1.5

Building Dockerfile.ros.noetic.cmake :

sudo docker build . -f Dockerfile.ros.noetic.cmake -t ros_noetic_20.04_cmake:1.0

