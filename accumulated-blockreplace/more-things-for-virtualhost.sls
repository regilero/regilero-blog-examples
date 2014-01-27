{# Include dependencies #}
include:
 - example_com_apache_virtualhost

example-a-first-rewrite-rule:
  file.accumulated:
    - name: extra-settings-example-virtualhost-maindir
    - filename: /etc/apache2/sites-available/100-example.com
    - text: |
        # this is an example of thing added in the middle
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME}  -d
        RewriteRule ^(.+[^/])$  $1/  [R]
    - require_in:
        - file: 100_example_com_virtualhost

example-some-icons-added:
  file.accumulated:
    - name: extra-settings-example-virtualhost
    - filename: /etc/apache2/sites-available/100-example.com
    - text: |
        # this is an example of thing added at the end'
        Alias /icons /path/to/icons>
        <Directory /path/to/icons
          Order allow,deny
          Allow from all
        </Directory>
    - require_in:
        - file: 100_example_com_virtualhost

example-another-thing:
  file.accumulated:
    - name: extra-settings-example-virtualhost-maindir
    - filename: /etc/apache2/sites-available/100-example.com
    - text: |
        # this is another example of thing added in the middle
        RewriteRule    ^/cgi-bin/imagemap(.*)  $1  [PT]
    - require_in:
        - file: 100_example_com_virtualhost
    - require:
        - file: example-a-first-rewrite-rule


example-another-thing-again:
  file.accumulated:
    - name: extra-settings-example-virtualhost-maindir
    - filename: /etc/apache2/sites-available/100-example.com
    - text: |
        # this is another example of thing added in the middle
        <FilesMatch "\.(gif|jpe?g|png)$">
            ExpiresDefault A2592000
        </FilesMatch>
    - require_in:
        - file: 100_example_com_virtualhost

