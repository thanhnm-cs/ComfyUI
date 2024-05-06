modelPath="/home/thanhnm2/ComfyUI/models/"
lfsAbsPath="/data/thanhnm2/comfyui/models/"
lfsAbsPathOutput="/data/thanhnm2/comfyui/output"


docker build --tag comfyui:latest . 

rsync -avz -rP ${modelPath} ${lfsAbsPath}
docker run -v ${lfsAbsPathOutput}:/workspace/output/ -v ${lfsAbsPath}:/workspace/models -d --gpus '"device=0,1"' --name="comfyui" comfyui:latest
# docker run -v ${lfsAbsPath}:/workspace/models -it --gpus '"device=0,1"' --name="comfyui" comfyui:latest