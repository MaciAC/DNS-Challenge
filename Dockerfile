FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y build-essential
# This will install Python, pip, pip3, and pip3.6.

RUN apt-get update
RUN apt-get install python3-pip -y

RUN curl https://bootstrap.pypa.io/ez_setup.py -o - | python3 && python3 -m easy_install pip
RUN apt-get update
RUN apt-get install -y python3.6-venv

# Inorder to run pip3.6, run it the following way `python3.6 -m pip`
# Update Python & Install wheel
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel
RUN python3 -m pip install numpy

RUN apt-get install libsndfile1-dev -y

RUN apt-get install llvm -y
RUN apt-get install llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime -y

RUN update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-6.0 6
RUN update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-10 10
RUN update-alternatives --config llvm-config

RUN LLVM_CONFIG=/usr/bin/llvm-config python3 -m pip install llvmlite
RUN python3 -m pip install numba

RUN python3 -m pip install librosa
RUN python3 -m pip install soundfile
RUN python3 -m pip install pandas

