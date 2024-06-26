# For more information, please refer to https://aka.ms/vscode-docker-python
FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

# # Keeps Python from generating .pyc files in the container
# ENV PYTHONDONTWRITEBYTECODE=1

# # Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED=1

# # Install pip requirements


COPY requirements.txt .
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
RUN python -m pip install -r requirements.txt

WORKDIR /workspace
COPY . /workspace

ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 git-all wget -y
RUN cd /workspace/custom_nodes && git clone https://github.com/ltdrdata/ComfyUI-Manager 

# RUN apt-get autoclean
# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /workspace
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "main.py"]
