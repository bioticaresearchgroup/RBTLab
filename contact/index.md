---
# CONTACT PAGE
# Contact methods as buttons (email / phone / address), a one-block address
# card for the lab, and two photos (department + university campus) side by
# side.
description: Contact the Regenerative Biomaterials and Theranostics Laboratory at CUSAT, Kochi, Kerala for collaborations, Ph.D. and postdoc inquiries.
title: Contact
nav:
  order: 8
  tooltip: Email, address, and location
---

# Contact

The lab is part of the [Department of Polymer Science and Rubber Technology](https://psrt.cusat.ac.in/) at the [Cochin University of Science and Technology](https://www.cusat.ac.in/) (CUSAT) in Kochi, Kerala, India. We are always glad to discuss collaborations, prospective Ph.D. and post-doctoral applications, or anything else about our work.

{%
  include button.html
  type="email"
  text="sailajags@cusat.ac.in"
  link="sailajags@cusat.ac.in"
%}
{%
  include button.html
  type="phone"
  text="+91 97447 99643"
  link="+91 97447 99643"
%}
{%
  include button.html
  type="address"
  tooltip="Our location on Google Maps for easy navigation"
  link="https://maps.app.goo.gl/ymBYWybp94H6aDvU8"
%}

{% include section.html %}

{% capture col1 %}

{%
  include figure.html
  image="images/PSRT.jpg"
  caption="Department of Polymer Science and Rubber Technology"
%}

{% endcapture %}

{% capture col2 %}

{%
  include figure.html
  image="images/CUSAT.jpg"
  caption="Cochin University of Science and Technology"
%}

{% endcapture %}
{% include cols.html col1=col1 col2=col2 %}
