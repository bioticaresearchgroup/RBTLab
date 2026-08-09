---
# PATENTS PAGE
# Search box + search info line, then all patents rendered as rich citations
# from _data/patents.yaml.
description: Indian and Japanese patents filed by the Regenerative Biomaterials and Theranostics Laboratory.
title: Patents
nav:
  order: 6
  tooltip: Patents
---

# Patents

Below you will find all our patents.

{% include section.html %}

{% include search-box.html %}

{% include search-info.html %}

{% include list.html data="patents" component="citation" style="rich" %}



