# Bitcoin Core Node 
> Quickly and easily run a bitcoin core node

---

**⚠️ This is experimental. Please use at your own risk.⚠️**

---

*Currently, this is only configured for testnet. Other networks coming soon...*


## Run
> Run bitcoin core and make RPC port accessible 
```
$ docker-compose up
```

## Usage:
### Requesting blockchain information
> Use bitcoin-cli on your local machine to request information from the node running in the docker container
```
$ bitcoin-cli -testnet -rpcuser=user -rpcpassword=password getblockchaininfo
```
### SSH into the container
```
docker exec -it bitcoind-testnet /bin/bash
```

## Requirements 
- [Docker](https://docs.docker.com/get-docker/)

# Notes
For some reason, when I change the dockerfile, changes are not reflected when I run docker compose. So to reflect them, I do the following:
```
docker stop $(docker ps -qa) && docker system prune -af --volumes
docker-compose down
docker-compose up --force-recreate
```
## License
MIT © [Joe Gesualdo]()
 
