test-etc-hosts-blockreplace-services-local:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP : salt managed zone : local services : please do not edit"
    - marker_end: "# BLOCK BOTTOM : local : end of salt managed zone --"
    - show_changes: True
    - append_if_not_found: True

test-etc-hosts-blockreplace-services-central:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP : salt managed zone : central services : please do not edit"
    - marker_end: "# BLOCK BOTTOM : central : end of salt managed zone --"
    - show_changes: True
    - append_if_not_found: True
