modelPath="/home/thanhnm2/ComfyUI/models/"
lfsAbsPath="/backup/thanhnm2/comfyui/models/"

docker build --tag comfyui:latest . 

rsync -avz -rP ${modelPath} ${lfsAbsPath}
docker run -v ${lfsAbsPath}:/workspace/models -d --gpus '"device=0,1"' --name="comfyui" comfyui:latest
# docker run -v ${lfsAbsPath}:/workspace/models -it --gpus '"device=0,1"' --name="comfyui" comfyui:latest