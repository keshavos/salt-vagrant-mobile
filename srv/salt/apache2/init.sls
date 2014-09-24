apache:
  pkg.installed:
    {% if grains['os'] == 'Windows' %}
    - name: iis
    {% elif grains['os'] == 'Ubuntu' %}
    - name: apache2
    {% endif %}
