#
# this dockerfile roughly follows the 'Installing from source' from:
#   http://wiki.ros.org/noetic/Installation/Source
#
#ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.5.0
#FROM ${BASE_IMAGE}
FROM ros_noetic_20.04:1.5


ARG ROS_PKG=ros_base
ENV ROS_DISTRO=noetic
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV ROS_PYTHON_VERSION=3

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace



# download and install cmake 3.22 
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2.tar.gz
RUN tar -zxvf cmake-3.22.2.tar.gz && \
    cd cmake-3.22.2 && \
    ./bootstrap && \
    make && \
    make install 



#RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -




# Open3d depencdencies replacing install_deps_ubuntu.sh






# Agile autonomy 
# RUN mkdir agile_autonomy_ws && \
#    cd agile_autonomy_ws && \
#    export CATKIN_WS=./catkin_aa && \
#    mkdir -p $CATKIN_WS/src && \
#    cd $CATKIN_WS && \
#    catkin && \
#    catkin config --extend /opt/ros/$ROS_VERSION && \
#    catkin config --merge-devel && \
#    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-fdiagnostics-color && \
#    cd src && \



#
# setup entrypoint
#
#COPY ./packages/ros_entrypoint.sh /ros_entrypoint.sh
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> /root/.bashrc
#ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
WORKDIR /
