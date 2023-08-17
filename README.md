## BitkubChain Solo Validator Node
This repository contain data for BikubChain POS validator node. It competible with linux/amd64 because geth from BikubChain official suport only linux/amd64

#### 1. Build local docker image and create alias cmd
```bash
# build docker image 
docker build -t bitkubchain/geth:2.1.0 .
# create alias
alias deth='docker run --rm -v $(pwd):/bkc-node/mainnet -it bitkubchain/geth:2.1.0'
# testing alias
deth version

# output
Geth
Version: 2.1.0-bkc-stable
Git Commit: 8ee545524b9411c306ebb62bcbfa4536264e20c2
Git Commit Date: 20230802
Architecture: amd64
Go Version: go1.18.10
Operating System: linux
GOPATH=
GOROOT=go

```

#### 2. Create a new validator account

```bash
# change pass.txt to your password
cp pass.txt.example pass.txt
vi pass.txt

# create new account
deth --datadir /bkc-node/mainnet/data account new --password bkc-node/mainnet/pass.txt

# output
Your new key was generated

Public address of the key:   0xF750B418...
Path of the secret key file: /bkc-node/mainnet/data/keystore/UTC--2023-08-16T18-38-20.836812793Z--f750b418d28e5ea....

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
```

#### 3. Initialize a genesis file
```bash
# initialize
deth --datadir /bkc-node/mainnet/data init /bkc-node/mainnet/genesis.json

# output
INFO [08-16|18:42:25.432] Writing custom genesis block 
INFO [08-16|18:42:25.433] Persisted trie from memory database      nodes=4 size=598.00B time="799.666µs" gcnodes=0 gcsize=0.00B gctime=0s livenodes=0 livesize=0.00B
INFO [08-16|18:42:25.443] Successfully wrote genesis state         database=lightchaindata                        hash=8a0f3e..158071
```

#### 4. Change wallet address in .env
```bash
# copy .env.example to .env
cp .env.example .env
vi .env

# change WALLET_ADDRESS from step 1 and save
WALLET_ADDRESS="0xF750B418d28e5Ea3443E2e04956d69125f7f062E"
```

#### 5. Running validator node using docker compose
```bash
# if using mac chip M1,M2
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# running validator node
docker compose up

```

