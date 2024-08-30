FROM python:3.12

# I'm splitting the dependencies and APPFL installation as MPI support was much more involved and time consuming to include.
# Since my main priority is gRPC deployments, I extracted just the dependencies required for that.

# Install APPFL dependencies required for gRPC deployments.
RUN pip install --no-cache-dir \
    "numpy<2" \
    torch \
    torchvision \
    grpcio \
    grpcio-tools \
    omegaconf \
    globus-sdk \
    globus-compute-sdk \
    globus-compute-endpoint \
    boto3 \
    botocore \
    lz4 \
    zfpy \
    zstd \
    blosc \
    python-xz \
    matplotlib

# Clone and install APPFL (without dependencies)
RUN git clone --depth=1 --single-branch https://github.com/APPFL/APPFL /APPFL && pip install --no-cache-dir --no-deps /APPFL
WORKDIR /APPFL/examples
