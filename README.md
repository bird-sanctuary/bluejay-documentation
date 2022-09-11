# Bluejay Documentation
The documentation can be viewed on [github pages](https://bird-sanctuary.github.io/bluejay-documentation/).

## Local development
Install [Jekyll](https://jekyllrb.com/docs/) dependencies:
```
bundle install
```

then bundle and serve
```
bundle exec jekyll serve
```

### Generating PUML images
When pushing to master, the workflow will automatically generate the SVGs from the PUML files. For local development it makes sense to generate the SVGs locally to make sure all of the links to them later work as expected.

Acquire [plantuml](https://github.com/plantuml/plantuml/releases) and run:

```
java -jar plantuml-1.2022.6.jar -v -tsvg -r -o ./svgs "./puml/**.puml"
```
