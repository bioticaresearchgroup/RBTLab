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
{%
  include grid.html
  content=content
  width="100%"
  
  image1="images/funding/RUSAlogo.png"
  link1="https://www.education.gov.in"
  tooltip1="Rashtriya Uchchattar Shiksha Abhiyan (RUSA)"

  image2="images/funding/AICTE.png"
  link2="https://aicte.gov.in"
  tooltip1="All India Council for Technical Education"

  image3="images/funding/SERB.png"
  link3="https://serb.gov.in"
  tooltip1="Science and Engineering Research Board"

  image4="images/funding/KSCSTE.jpg"
  link4="https://kscste.kerala.gov.in"
  tooltip1="Kerala State Council for Science, Technology and Environment"

  image5="images/funding/DBT.png"
  link5="https://dbt.gov.in"
  tooltip1="Department of Biotechnology, Government of India"
%}

{% include section.html %}



