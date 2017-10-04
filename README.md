# Jekyll-WhereContainsAny
A Liquid filter for Jekyll that returns members of a collection where a specified field contains one or more elements of a CSV list

## Installation
Copy the ```WhereContainsAny.rb``` file into your Jekyll site's plugins folder (usually ```/_plugins```) and celebrate -- you're done!

## Usage Details

```Gherkin

Scenario: Filter a Liquid collection for items tagged with one or more of a selection of tags
  Given a "source" collection of items with a "tags" field
  Given a CSV string of tags to search for  
  When the filter is applied with these two arguments  
  Then the filter returns a collection of items where each item's "tags" field contains one or more of the searched-for tags

```

Usage example:

_Given a "source" collection of items with a "tags" field_

(./_data/someitems.yaml):
```yaml

- name: The name of an example item
    tags: ruby, programming, examples

- name: The name of another item
    tags: markdown, ruby

- name: The name of a third item
    tags: programming, documentation, examples

```

_Given a CSV string of tags to search for_

```
"ruby, programming"
```

_When the filter is applied with these two arguments_

```liquid

{{ site.data.someitems | where_contains_any: "tags", "markdown, ruby" }}

```

_Then the filter returns a collection of items where each item's "tags" field contains one or more of the searched-for tags_

```yaml

- name: The name of an example item
  tags: ruby, programming, examples
  
- name: The name of another item
  tags: markdown, ruby

```
