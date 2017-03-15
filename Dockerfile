FROM kscape/docker-rpi-opencv3-buildtools

RUN cd /tmp && \ 
    wget -q -O opencv.zip https://github.com/opencv/opencv/archive/3.2.0.zip && \
    unzip -q opencv.zip && \
    wget -q -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip && \
    unzip -q opencv_contrib.zip && \
    mkdir opencv-3.2.0/build && \
    cd opencv-3.2.0/build && \
    wget -q -O opencv.zip https://github.com/opencv/opencv/archive/3.2.0.zip && \
    unzip -q opencv.zip && \
    wget -q -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip && \
    unzip -q opencv_contrib.zip && \
    mkdir opencv-3.2.0/build && \
    cd opencv-3.2.0/build && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_SHARED_LIBRARY=NO \
    -D BUILD_opencv_python=NO \
    -D WITH_WEBP=NO \
    -D WITH_OPENEXR=NO \
    -D BUILD_TESTS=NO \
    -D BUILD_PERF_TESTS=NO \
    .. && \
    make -j1  VERBOSE=1 && \
    make install

ENV OPENCV_JAVA_PATH /usr/local/share/OpenCV/java
ENV OPENCV_SHARED_LIB $OPENCV_JAVA_PATH/libopencv_java320.so
