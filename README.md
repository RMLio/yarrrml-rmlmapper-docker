# yarrrml-rmlmapper-docker
Generate RDF with YARRRML in one step.

The container image contains [YARRRML Paarser](https://github.com/RMLio/yarrrml-parser)
to parse the YARRRML mapping rules
and uses [RMLMapper](https://github.com/RMLio/rmlmapper-java) to generate RDF.

## Build

To build a container named `yarrrmlmapper` using the latest **release** versions of YARRRML Parser and RMLMapper :

```shell
docker build -t yarrrmlmapper docker
```

To build a container named `yarrrmlmapper` using the latest **development** versions of YARRRML Parser and RMLMapper :

```shell
docker build -f docker/Dockerfile_dev -t yarrrmlmapper docker
```

## Example

To run the advanced example from http://rml.io/yarrrml/matey/:

```shell
docker container run --rm --name yarrrmlmapper -v "$(pwd)/example":/mnt/data yarrrmlmapper mappings.yarrrml.yml --serialization turtle
```

## General run instructions

```shell
docker run --rm \
--name <container name> \
-v <directory of mapping file and optionally data files>:/mnt/data \
<YARRRML mapping file name>
[-classpath <additional classpath for RMLMapper>]
<rmlmapper-java options>
```

* The container is intended for a one-time job only, hence the `--rm` option.
* If an output file is specified for RMLMapper (`--outputfile`) make sure to write it in
(a subdir of `/mnt/data` for it to be written in the mounted directory given with the `-v` option.
* If the mapping file refers to input files, these input files need to be somewhere in the mounted directory.
Other directories are not accessible for the container.
* The `--classpath` option is mainly used to add a jar with FnO functions.

## License

This code is copyrighted by [Ghent University – imec](http://idlab.ugent.be/)
and released under the [MIT license](http://opensource.org/licenses/MIT).
