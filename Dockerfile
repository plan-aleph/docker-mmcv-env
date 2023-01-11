ARG PYTORCH="1.10.0"

FROM nvcr.io/nvidia/pytorch:${PYTORCH}-py3

RUN : \
    && apt-get update \
    && apt-get install -y ffmpeg libsm6 libxext6 git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG MMCV_NAME="mmcv-full"
ARG MMCV_VERSION

# Install MMCV
RUN : \
    && pip install --no-cache-dir -U openmim \
    && mim install --no-cache-dir ${MMCV_NAME}==${MMCV_VERSION}
