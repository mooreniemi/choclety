![choclety?](/choclety.png)

# choclety
a hypermedia api spec grapher

## purpose

Input: an api spec file.
Output: a useful graph of your api.

To generate a graph, run `./choc g <api-spec>.json`, ie.:

```
./choc g ApiSpecs/api-spec.json
./choc g ApiSpecs/api-spec-2.json
./choc g ApiSpecs/api-spec-3.json
```

Then run a server in the root directory to view, ie.:

```
python -m SimpleHTTPServer 8000
```
