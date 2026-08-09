---
# FACILITIES PAGE
# Intro line, then every instrument rendered via facility.html from
# _data/facilities.yaml. Ends with an instrumentation-request CTA.
description: Instrumentation for polymer processing, nanomaterial synthesis, mechanical and thermal characterization, and biological evaluation.
title: Facilities
nav:
  order: 5
  tooltip: Facilities and Instruments
---

# Facilities

The Regenerative Biomaterials and Theranostics Laboratory maintains a dedicated instrumentation suite for polymer processing, nanomaterial synthesis, mechanical and thermal characterisation, and biological evaluation.

{% include section.html %}

{% assign facilities = site.data.facilities | default: "" %}
{% for f in facilities %}
  {% include facility.html facility=f %}
{% endfor %}

{% include section.html %}

{{ " " }}
<div class="more-info">
  <p>
    <i class="icon fa-solid fa-envelope"></i>
    For instrumentation requests or collaborative access, <a href="{{ "contact/" | relative_url }}">contact the laboratory</a>.
  </p>
</div>