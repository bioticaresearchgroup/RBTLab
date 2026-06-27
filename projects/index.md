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
{% capture content %}
[![Rashtriya Uchchattar Shiksha Abhiyan (RUSA)](/images/RUSAlogo.png)](https://www.education.gov.in/rusa)

[![All India Council for Technical Education](/images/AICTE.png)](https://aicte.gov.in/)

[![Science and Engineering Research Board](/images/SERB.png)](https://serb.gov.in/)

[![Kerala State Council for Science, Technology and Environment](/images/KSCSTE.jpg)](https://kscste.kerala.gov.in/)

[![Department of Biotechnology, Government of India](/images/DBT.png)](https://dbt.gov.in/)
{% endcapture %}
