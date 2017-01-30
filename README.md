![choclety?](/choclety.png)

# choclety
a hypermedia api spec grapher

## purpose

Input: an api spec file.
Output: a useful graph of your api.

Here's a screenshot of the example output, with shortest path to your revenue generating node highlighted:

![](/choclety-graph.png)

## usage

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
