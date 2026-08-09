---
title: Home
nav:
  order: 0
  tooltip: Homepage
---

<section class="hero">
  <h1><span class="kw kw-autonomy">Biomaterials</span>, <span class="kw kw-terminals">nanomedicine</span> and <span class="kw kw-maritime">theranostics</span> <span aria-hidden="true">&mdash;</span> engineered for clinical translation.</h1>
  <p class="lede">The <strong>Regenerative Biomaterials and Theranostics Laboratory</strong> at Cochin University of Science and Technology designs high-performance polymer matrices, functionalized nanocomposites, and responsive nanomedicines that bridge fundamental macromolecular engineering with clinical translation.</p>
  <p class="meta">Led by <a href="{{ "team/" | relative_url }}">Prof. G.S. Sailaja</a> at the Department of Polymer Science and Rubber Technology. Our work integrates expertise in biomaterials, nanomedicine, and theranostics.</p>
</section>

{% include section.html %}

<div class="section-head">
  <h2>Research areas</h2>
  <a class="section-head-more" href="{{ "projects/" | relative_url }}">All projects <span aria-hidden="true">&rarr;</span></a>
</div>

<div class="card-grid card-grid--3">
  <div class="card">
    <span class="card-image"><img src="{{ "images/CQB1.jpg" | relative_url }}" alt="Biomaterials &amp; Tissue Engineering" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Biomaterials &amp; Tissue Engineering</span>
      <p>Bone tissue engineering and smart biomimetic interfaces that guide osteogenesis and direct bone bonding.</p>
    </span>
  </div>
  <div class="card">
    <span class="card-image"><img src="{{ "images/areogel.jpg" | relative_url }}" alt="Nanomedicine &amp; Theranostics" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Nanomedicine &amp; Theranostics</span>
      <p>Dual-functional, nanopharmaceutical stimuline-loaded complexes that enable diagnostics, targeted drug delivery, and magnetic hyperthermia.</p>
    </span>
  </div>
  <div class="card">
    <span class="card-image"><img src="{{ "images/PCLB.jpg" | relative_url }}" alt="Radiopaque &amp; Antimicrobial Materials" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Radiopaque &amp; Antimicrobial Materials</span>
      <p>Biomedical arrays that are inherently visible under X-ray imaging, plus antimicrobial formulations that prevent nosocomial infections.</p>
    </span>
  </div>
  <div class="card">
    <span class="card-image"><img src="{{ "images/suturenew.png" | relative_url }}" alt="Regenerative scaffolds" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Regenerative scaffolds</span>
      <p>Synthetic-natural polymer matrices engineered for bone regeneration and soft-tissue repair.</p>
    </span>
  </div>
  <div class="card">
    <span class="card-image"><img src="{{ "images/project1.png" | relative_url }}" alt="Nanomedicine platforms" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Nanomedicine platforms</span>
      <p>Responsive nanocarrier platforms for image-guided therapy and controlled drug release.</p>
    </span>
  </div>
  <div class="card card--ga">
    <span class="card-image"><img src="{{ "images/radiopaque-review-ga.jpg" | relative_url }}" alt="Radiopaque implants" loading="lazy"></span>
    <span class="card-text">
      <span class="card-title">Radiopaque implants</span>
      <p>X-ray-visible biomaterials that combine structural function with imaging compatibility.</p>
    </span>
  </div>
</div>

{% include section.html %}

<div class="section-head">
  <h2>Latest updates</h2>
</div>

{% include news.html %}

{% include section.html %}

<div class="section-head">
  <h2>Recent projects</h2>
  <a class="section-head-more" href="{{ "projects/" | relative_url }}">All projects <span aria-hidden="true">&rarr;</span></a>
</div>

{% include carousel.html %}

{% include section.html %}

<div class="section-head">
  <h2>Lab highlights</h2>
</div>

{% include carousel.html data="highlights" link_base="" captions="" %}

{% include section.html %}

<div class="section-head">
  <h2>Featured papers</h2>
  <a class="section-head-more" href="{{ "publications/" | relative_url }}">All papers <span aria-hidden="true">&rarr;</span></a>
</div>

{% include papers.html %}

{% include section.html %}

<div class="section-head">
  <h2>Members</h2>
  <a class="section-head-more" href="{{ "team/" | relative_url }}">Full team <span aria-hidden="true">&rarr;</span></a>
</div>

<div class="portrait-grid portrait-grid--compact">
  {% include list.html data="members" component="portrait" filter="role == 'principal-investigator' and group != 'alum'" %}
  {% include list.html data="members" component="portrait" filter="role == 'postdoc' and group != 'alum'" %}
  {% include list.html data="members" component="portrait" filter="role == 'phd' and group != 'alum'" %}
  {% include list.html data="members" component="portrait" filter="role == 'undergrad1' and group != 'alum'" %}
  {% include list.html data="members" component="portrait" filter="role == 'undergrad2' and group != 'alum'" %}
</div>