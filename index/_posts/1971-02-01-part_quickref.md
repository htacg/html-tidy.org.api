---
title:    "Quick Reference"
bg:       "#C6F500"
color:    black    
style:    left
fa-icon:  pencil
---

# Quick Reference

These are the Quick Reference cards for each release version of **HTML Tidy**.

<ul>
{% for item in site.data.api_versions %}
  <li>
    <a href="{{ site.baseurl }}/tidy/quickref_{{ item.version }}.html">{{ item.version }}</a>
  </li>
{% endfor %}
</ul>