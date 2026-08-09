---
title: Projects
nav:
  order: 3
  tooltip: Ongoing and completed projects
---

# Research Projects

The Regenerative Biomaterials and Theranostics Laboratory develops clinically translation-ready biomaterials and nanomedicines. Our projects span image-guided bone implants, cancer theranostics, cellular scaffolds, and antimicrobial formulations, with grants from key national funding agencies.

Research in the lab ranges from fundamental materials design to applications validated through animal models and regulated translation.

{% include section.html %}

[//]: # "collect all distinct project tags for the filter strip"
{% assign project_tags = "" | split: "," %}
{% for p in site.data.projects %}
  {% assign project_tags = project_tags | concat: p.tags %}
{% endfor %}
{% assign project_tags = project_tags | uniq | join: ", " %}

<strong>Filter by tag</strong>
{% include tags.html tags=project_tags %}

{% include search-info.html %}

{% include section.html %}

{% assign projects = site.data.projects | default: "" %}
{% for p in projects %}
  {% include project.html project=p %}
{% endfor %}

{% include section.html %}

{{ " " }}
<div class="more-info">
  <p>
    <i class="icon fa-solid fa-file-lines"></i>
    For a list of recent research outputs, visit our <a href="{{ "publications/" | relative_url }}">publications page</a>.
  </p>
</div>