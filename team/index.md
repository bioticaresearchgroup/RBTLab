---
title: Team
nav:
  order: 3
  tooltip: About our team
---

# {% include icon.html icon="fa-solid fa-users" %}Team

Meet our team:

{% include section.html %}

{% include list.html data="members" component="portrait" filter="role == 'pi'" %}
{% include list.html data="members" component="portrait" filter="role != 'pi'" %}

{% include section.html background="images/background.jpg" dark=true %}

Alumini

{% include section.html %}

{% capture content %}

{% include list.html data="members" component="portrait" filter="role == 'pi'" %}

{% endcapture %}

{% include grid.html style="square" content=content %}
