---
title: Team
nav:
  order: 3
  tooltip: About our team
---

# {% include icon.html icon="fa-solid fa-users" %}Team

Meet our team:

{% include section.html %}

{% include list.html data="members" component="portrait" filter="role == 'principal-investigator' and group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role == 'postdoc' and group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role == 'phd' and group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role == 'undergrad1' and group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="role == 'undergrad2' and group != 'alum'" %}

{% include section.html background="images/background.jpg" dark=true %}

*Interested in joining us? We are always looking for motivated Ph.D. candidates and post-doctoral researchers. Check our Contact page for application pathways.*

{%
  include button.html
  icon="fa-solid fa-handshake-angle"
  text="Join the Team"
  link="contact"
  style="button"
%}

{% include section.html %}

## Alumni

Gone but never forgotten.
These are past lab members who have moved on to other school programs, new jobs, or elsewhere.
They have all made lasting contributions to science and to our hearts. ❤️

{% include list.html data="members" component="portrait" filter="role == 'postdoc' and group == 'alum'" style="small" %}
{% include list.html data="members" component="portrait" filter="role == 'phd' and group == 'alum'" style="small" %}
{% include list.html data="members" component="portrait" filter="role == 'undergrad1' and group == 'alum'" style="small" %}
{% include list.html data="members" component="portrait" filter="role == 'undergrad2' and group == 'alum'" style="small" %}

{% include section.html %}

{% capture content %}

{% endcapture %}

{% include grid.html style="square" content=content %}
