# Bluejay Documentation
The documentation can be viewed on [github pages](https://bird-sanctuary.github.io/bluejay-documentation/).

## Custom filters
The following custom liquid filters are  available:

### search_code_url

Will generate a URl linking to the github search result page for a given term within the repo set in the **github_bluejay_url** field in **_config.yml**.

Example:
```
[t3_int]({{'t3_int' | search_code_url}}){:target="_blank"}.
```

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
