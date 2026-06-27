---
title: Projects
nav:
  order: 2
  tooltip: Ongoing and completed projects
---

# {% include icon.html icon="fa-solid fa-wrench" %}Projects

A comprehensive overview of our completed and active research projects. Funded by key national agencies and  institutional grants.


{% include search-info.html %}

{% include section.html %}

## Featured

{% include list.html component="card" data="projects" filter="group == 'featured'" %}

{% include section.html %}

## More

{% include list.html component="card" data="projects" filter="!group" style="small" %}
