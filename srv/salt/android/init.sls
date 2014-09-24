android:
  pkg.installed:
    {% if grains['os'] == 'Windows' %}
    - name: android-windows
    {% elif grains['os'] == 'Ubuntu' %}
    - name: android-ubuntu
    {% endif %}
