---
title: Team
nav:
  order: 1
  tooltip: About our team
---

# Team

Meet our team:

{% include section.html %}

<div class="section-head">
  <h2>Director</h2>
</div>

{% include director.html %}

{% include section.html %}

<div class="section-head">
  <h2>Members</h2>
</div>

<div class="portrait-grid">
  {% include list.html data="members" component="portrait" filter="role != 'principal-investigator' and group != 'alum'" %}
</div>

{% include section.html %}

<div class="section-head">
  <h2>Alumni</h2>
</div>

Gone but never forgotten. These are past lab members who have moved on to new positions, schools, or elsewhere. They have all made lasting contributions to science and to our hearts.

<div class="portrait-grid">
  {% include list.html data="members" component="portrait" filter="group == 'alum'" style="small" %}
</div>

{% include section.html %}

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
