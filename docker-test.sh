image=dotfiles:latest

docker build -t $image .
docker run -t -i $image
