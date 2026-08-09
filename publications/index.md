---
# PUBLICATIONS PAGE
# One highlighted rich citation, then a search box + tag filter strip
# (tags gathered from _data/citation-tags.yaml) over the full citation list.
title: Papers
nav:
  order: 2
  tooltip: Papers
---

# Papers

We publish national/international patents and high-impact peer-reviewed research papers in leading journals across diverse topics including biomaterials and polymers for bone regeneration, antibacterial formulations, nanomedicine, and theranostic materials. You can find a selection of our papers below.

{% include section.html %}

## Highlighted

{% include citation.html lookup="Bismuth/Fe3O4 in situ metal organic framework nanocomposite for image guided magnetic hyperthermia therapy" style="rich" %}

{% include section.html %}

## Journal Articles

{% include search-box.html %}

[//]: # "collect all distinct citation tags for the filter strip"
{% assign citation_tags = "" | split: "," %}
{% for entry in site.data.citation-tags %}
  {% assign citation_tags = citation_tags | concat: entry.tags %}
{% endfor %}
{% assign citation_tags = citation_tags | uniq | join: ", " %}

<strong>Filter by tag</strong>
{% include tags.html tags=citation_tags %}

{% include search-info.html %}

{% include list.html data="citations" component="citation" style="rich" %}

