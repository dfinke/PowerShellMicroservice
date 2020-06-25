param(
    $name = "podeserver",
    $dockerTag = "latest"
)

$dockImageName = "$($name):$($dockerTag)"

# Synopsis: Stop and Remove docker image.
task StopContainerAndRemoveImage {
    docker rm (docker ps -aq) -f; docker rmi (docker image ls -qa) -f
}

# Synopsis: Stop docker container.
task StopContainer {
    docker stop $name
}

# Synopsis: Remove docker container.
task RemoveContainer {
    docker ps -aq | ForEach-Object { docker rm $_ }
}

# Synopsis: Build  docker image.
task BuildImage {
    docker build --tag $dockImageName .
}

# Synopsis: Run  docker image.
task RunContainer {
    docker run -d --name $name -p 8080:8080 $dockImageName
}

task . StopContainer, RemoveContainer, BuildImage, RunContainer