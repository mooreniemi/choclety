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

## the spec format

Is not formalized. But essentially forces you to write your API spec as a graph in the form of an edge list and a node list. `choc` is building adjency lists for you automatically. Technically we could get everything we need from edges, but then they start to get a ton of properties.

The spec format at the top level requires:

```json
{
  "state_transitions": [],
  "state_representations": []
}
```

For generating a graph, `StateTransition`s require:

```json
{
  "source": "from node",
  "target": "to node",
  "link_relation": "edge label",
  "verb": "protocol specific modifier for your remote call, ie. POST in http"
}
```

For generating an api, `StateTransition`s require one of the 3:

```json
{
  "url_template": "function signature of your remote call",
  "url_template_type": "named templates, ie. collection_item",
  "url": "static direct url"
}
```

For generating a graph or api, `StateRepresentation`s require:


```json
{
  "name": "name of representation, must be unique. namespace with . if necessary, ie. namespace.name",
  "noun": "generated_revenue|error|null"
}
```
