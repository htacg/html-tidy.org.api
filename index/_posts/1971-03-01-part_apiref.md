---
title:    "API Reference"
bg:       "#00AC6B"
color:    black    
style:    left
fa-icon:  cog
---

# API Reference

The following consists of the archives of the generated API documentation for each
released version of **HTML Tidy**.

<ul>
{% for item in site.data.api_versions %}
  <li>
    <a href="{{ site.baseurl }}/tidy/tidylib_api_{{ item.version }}">{{ item.version }}</a>
  </li>
{% endfor %}
</ul>
