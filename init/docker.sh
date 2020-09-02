docker run -e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" -p 1883:1883 -p 8888:8888 --name vernemq1 -d vernemq/vernemq

docker run -e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" -e "DOCKER_VERNEMQ_DISCOVERY_NODE=172.17.0.2" -p 1884:1883 -p 8889:8888 --name vernemq2 -d vernemq/vernemq

docker run -e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" -e "DOCKER_VERNEMQ_DISCOVERY_NODE=172.17.0.2" -p 1885:1883 -p 8890:8888 --name vernemq3 -d vernemq/vernemq