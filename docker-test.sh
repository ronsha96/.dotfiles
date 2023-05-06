tag=dotfiles:latest

docker build -t $tag .
docker run --interactive --tty --rm --user username $tag
