test-etc-hosts-blockreplace-services:
  file.blockreplace:
    - name: /etc/hosts
    - marker_start: "# BLOCK TOP : salt managed zone : local services : please do not edit"
    - marker_end: "# BLOCK BOTTOM : end of salt managed zone --"
    - content: '# here be dragons'
    - show_changes: True
