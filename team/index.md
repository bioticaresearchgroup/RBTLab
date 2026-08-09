---
# TEAM PAGE
# Director block (director.html), active members grouped by role in portrait
# grids (postdoc / PhD / project student / intern), then alumni in the same
# role groups shown with small portraits. Closes with a "Join the Team" CTA.
title: Team
nav:
  order: 1
  tooltip: About our team
---

# Team

Meet our team:

{% include section.html %}

<div class="section-head">
  <h2>Principal Investigator</h2>
</div>

{% include director.html %}

{% include section.html %}

<div class="section-head">
  <h2>Members</h2>
</div>

{% assign current = site.members | where_exp: "m", "m.group != 'alum'" %}

{% assign current_postdoc = current | where: "role", "postdoc" %}
{% if current_postdoc.size > 0 %}
  <div class="section-head sub">
    <h3>Postdoctoral Researchers</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'postdoc' and group != 'alum'" %}
  </div>
{% endif %}

{% assign current_phd = current | where: "role", "phd" %}
{% if current_phd.size > 0 %}
  <div class="section-head sub">
    <h3>PhD Students</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'phd' and group != 'alum'" %}
  </div>
{% endif %}

{% assign current_undergrad1 = current | where: "role", "undergrad1" %}
{% if current_undergrad1.size > 0 %}
  <div class="section-head sub">
    <h3>Project Students</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'undergrad1' and group != 'alum'" %}
  </div>
{% endif %}

{% assign current_undergrad2 = current | where: "role", "undergrad2" %}
{% if current_undergrad2.size > 0 %}
  <div class="section-head sub">
    <h3>Interns</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'undergrad2' and group != 'alum'" %}
  </div>
{% endif %}

{% include section.html %}

<div class="section-head">
  <h2>Alumni</h2>
</div>

Gone but never forgotten. These are past lab members who have moved on to new positions, schools, or elsewhere. They have all made lasting contributions to science and to our hearts.

{% assign alumnus = site.members | where: "group", "alum" %}
{% assign alumni_postdoc = alumnus | where: "role", "postdoc" %}
{% if alumni_postdoc.size > 0 %}
  <div class="section-head sub">
    <h3>Postdoctoral Researchers</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'postdoc' and group == 'alum'" style="small" %}
  </div>
{% endif %}

{% assign alumni_phd = alumnus | where: "role", "phd" %}
{% if alumni_phd.size > 0 %}
  <div class="section-head sub">
    <h3>PhD Students</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'phd' and group == 'alum'" style="small" %}
  </div>
{% endif %}

{% assign alumni_undergrad1 = alumnus | where: "role", "undergrad1" %}
{% if alumni_undergrad1.size > 0 %}
  <div class="section-head sub">
    <h3>Project Students</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'undergrad1' and group == 'alum'" style="small" %}
  </div>
{% endif %}

{% assign alumni_undergrad2 = alumnus | where: "role", "undergrad2" %}
{% if alumni_undergrad2.size > 0 %}
  <div class="section-head sub">
    <h3>Interns</h3>
  </div>

  <div class="portrait-grid">
    {% include list.html data="members" component="portrait" filter="role == 'undergrad2' and group == 'alum'" style="small" %}
  </div>
{% endif %}

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
