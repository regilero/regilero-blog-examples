apache-install:
  pkg.installed:
    - pkgs:
      - apache2

100_example_com_virtualhost:
  file.managed:
    - source: salt://files/apache_vhost
    - name: /etc/apache2/sites-available/100-example.com
    - user: root
    - group: root
    - mode: "0664"
    - template: jinja
    - defaults:
        docroot: /path/to/www
        servername: example.com
    - require:
        - pkg: apache-install
