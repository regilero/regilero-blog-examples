{# Include dependencies #}
include:
    - hostsedit_acc

hostadata1-external-google-dns:
  file.accumulated:
    - name: unused
    - filename: /etc/hosts
    - text: |
        8.8.8.8 ns1.google.com
        8.8.8.4 ns2.google.com
    - require_in:
        - file: test-etc-hosts-blockreplace-services-central

hostadata2-external-thing:
  file.accumulated:
    - name: unused
    - filename: /etc/hosts
    - text: "93.184.216.119 : www.example.com"
    - require_in:
        - file: test-etc-hosts-blockreplace-services-central

hostdata3-internal-stuff1:
  file.accumulated:
    - name: unused
    - filename: /etc/hosts
    - text: "127.0.0.1 foo bar foo.local.net bar.local.net"
    - require_in:
        - file: test-etc-hosts-blockreplace-services-local

hostdata4-internal-stuff2:
  file.accumulated:
    - name: unused
    - filename: /etc/hosts
    - text: |
        127.0.0.1 db.local.net
        127.0.0.1 http.local.net
        127.0.0.1 foobar
    - require_in:
        - file: test-etc-hosts-blockreplace-services-local

