# Filecoin mining with docker using Reference implementation

*Overview*

Purpose is to run the go-filecoin default implementation from source with a local data directory. 

```bash
git clone git@github.com:digitaldonkey/docker-go-filecoin.git
cd docker-go-filecoin
```

## Build Base image "filecoin_base" from go-filecoin Dockerfile

```bash
git clone git@github.com:filecoin-project/go-filecoin.git
cd go-filecoin
```

Check out the go-filecoin version you want to run. e.g:

```bash
git checkout 0.2.2 && git checkout -b 0.2.2 
```

Create a local Docker image and give it a name and tag. 

```bash
docker build -t filecoin_base:0.2.2 .
```

<small>**Note:**<br/>Name and tag must be corresponding with `FROM filecoin_base:0.2.2` as set in *docker-go-filecoin/Dockerfile*.</small>

## Start mining

Get the composer files

```bash


docker-compose build
docker-compose up
```

To access your Miner via SSH

```bash
docker exec -it  dockerfilecoin_filecoin_1  /bin/sh
```

**Run commands directly**

Check for Peers
```bash
docker exec -it dockerfilecoin_filecoin_1 /usr/local/bin/go-filecoin swarm peers --repodir=/data/filecoin/.filecoin
```

The above image name might differ. Find your instances with

```bash
docker-compose ps
```
run in your docker-compose-filecoin dir

