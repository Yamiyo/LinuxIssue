# intro
### AB for get
script
```bash
concurrency=$1
totalnumber=$2
SOME_URL="127.0.0.1:80"
ab -c $concurrency -n $totalnumber http://$SOME_URL/
```

### AB for post
script
```bash
concurrency=$1
totalnumber=$2
SOME_URL="127.0.0.1:80"
ab -p post.json -T application/json -c $concurrency -n $totalnumber http://$SOME_URL/
```

post.json
```json
{
    "data": "just data",
    "params": "just parameters",
}
```
