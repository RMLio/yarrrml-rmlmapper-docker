# yarrrml-rmlmapper-docker
Generate RDF from YARRRML in one step.

## Build

To build a container named `yarrrmlmapper`:

```
docker build -t yarrrmlmapper docker
```

## Example 

To run the advanced example from http://rml.io/yarrrml/matey/:

```
docker run --rm --name yarrrmlmappertest -v "$(pwd)/example":/home/rmluser/data yarrrmlmapper mappings.yarrrml.yml --serialization turtle
```

## General run instructions

```
docker run --rm \
--name <container name> \
-v <directory of mapping file and optionally data files are stored>:/home/rmluser/data \
<YARRRML mapping file name>
<rmlmapper-java options>
```

* The container is intended a one-time job only, hence the `--rm` option.
* If an output file is specified for the RMLMapper (`--outputfile`), it will be written in the mounted directory given with the `-v` option.
