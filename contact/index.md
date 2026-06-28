---
title: Contact
nav:
  order: 5
  tooltip: Email, address, and location
---

# {% include icon.html icon="fa-regular fa-envelope" %}Contact

Our lab is part of the [Cochin University of Science and Technology](https://www.cusat.ac.in/)’s [Department of Polymer Science and Rubber Technology](https://psrt.cusat.ac.in/).

{%
  include button.html
  type="email"
  text="sailajags@cusat.ac.in"
  link="sailajags@cusat.ac.in"
%}
{%
  include button.html
  type="phone"
  text="+91 9744799643"
  link="+91 9744799643"
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

{% include section.html dark=true %}

## Highlights

<div class="glider-container">
  <div class="glide">
    <div class="glide__track" data-glide-el="track">
      <div class="glide__slides">
        {% include figure.html image="images/G1.jpg" component="" glider=true style="slide" %}
        {% include figure.html image="images/G2.jpg" component="" glider=true style="slide" %}
        {% include figure.html image="images/G3.jpg" component="" glider=true style="slide" %}
        {% include figure.html image="images/G4.jpg" component="" glider=true style="slide" %}
      </div>
    </div>
    <div class="glide__arrows" data-glide-el="controls">
      <button class="glide__arrow glide__arrow--left" data-glide-dir="<">{% include icon.html icon="fa-solid fa-arrow-left" %}</button>
      <button class="glide__arrow glide__arrow--right" data-glide-dir=">">{% include icon.html icon="fa-solid fa-arrow-right" %}</button>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@glidejs/glide"></script>
<script>
  const glide = new Glide('.glide', {
    type: "carousel",
    perView: 2,
    breakpoints: {
      600: { perView: 1 },
      1200: { perView: 2 }
    },
    autoplay: 5000,
    hoverpause: true,
    focusAt: "center"
  }).mount()
</script>
