# Filecoin mining with docker using Reference implementation

*Overview*

# Clone go-filecoin repo and build Docker
# Set up a local data directory
# Run go-filecoin miner with docker-compose

Starting point is a local directory _FileCoinWork_:

```bash
mkdir FileCoinWork && cd  "$_"
```

## Build Base image "filecoin_base" from go-filecoin Dockerfile

```bash
git clone git@github.com:filecoin-project/go-filecoin.git
cd go-filecoin

Search for current pre-stable tag (Its the "User Devnet Release 0.2.X" basge in above repository).
Or whatever filecoin version you want to run. e.g:

git checkout -b 0.2.2 && git checkout 0.2.2
```

Create a local Docker image and give it an name and tag

```bash
docker build -t filecoin_base:0.2.2 .
```

## Set up local data directory

```bash
cd FileCoinWork
mkdir filecoin_data
```

## Start mining

Get the composer files

```bash
cd FileCoinWork

git clone git@github.com:digitaldonkey/docker-go-filecoin.git
cd docker-go-filecoin

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

