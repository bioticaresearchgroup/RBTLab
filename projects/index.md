---
title: Projects
nav:
  order: 2
  tooltip: Ongoing and completed projects
---

# {% include icon.html icon="fa-solid fa-wrench" %}Projects

A comprehensive overview of our completed and active research projects. Funded by key national agencies and  institutional grants.

{% include tags.html tags="ongoing, completed" %}

{% include search-info.html %}

{% include section.html %}

## Featured

{% include list.html component="card" data="projects" filter="group == 'featured'" %}

{% include section.html %}

## Ongoing

{% include list.html component="card" data="projects" filter="group == 'ongoing'" style="small" %}

## Completed

{% include list.html component="card" data="projects" filter="group == 'completed'" style="small" %}

## Funding

Our work is made possible by the following organizations.
{% capture content %}
  {% include figure.html image="images/funding/RUSAlogo.png" link="https://www.education.gov.in" tooltip="Rashtriya Uchchattar Shiksha Abhiyan (RUSA)" %}
  {% include figure.html image="images/funding/AICTE.png" link="https://aicte.gov.in" tooltip="All India Council for Technical Education" %}
  {% include figure.html image="images/funding/SERB.png" link="https://serb.gov.in" tooltip="Science and Engineering Research Board" %}
  {% include figure.html image="images/funding/KSCSTE.jpg" link="https://dbt.gov.in" tooltip="Kerala State Council for Science, Technology and Environment" %}
  {% include figure.html image="images/funding/DBT.png" link="https://www.education.gov.in" tooltip="Department of Biotechnology, Government of India" %}
{% endcapture %}

{%
  include grid.html
  content=content
  width="100%"
%}



