test-etc-hosts-blockreplace-services-local:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP : salt managed zone : local services : please do not edit"
    - marker_end: "# BLOCK BOTTOM : local : end of salt managed zone --"
    - content: |
        127.0.0.1 db.local.net
        127.0.0.1 http.local.net
        127.0.0.1 foo bar foo.local.net bar.local.net
        127.0.0.1 foobar # with a comment
    - show_changes: True
    - append_if_not_found: True

test-etc-hosts-blockreplace-services-central:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP : salt managed zone : central services : please do not edit"
    - marker_end: "# BLOCK BOTTOM : central : end of salt managed zone --"
    - content: |
        8.8.8.8 ns1.dns.net
        8.8.4.4 ns2.dns.net
    - show_changes: True
    - append_if_not_found: True
