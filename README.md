### Easy Youtrack Installation

1. Install docker
2. Run `docker build -t youtrack .`
3. Run `docker run --publish 6061:8080 --rm youtrack sh run.sh`
4. For the first installation, copy the key from console
5. Open `http://localhost:6061` and put the key
