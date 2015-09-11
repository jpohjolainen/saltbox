nginx-server:
  pkg.installed:
    - name: nginx

nginx-config:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/files/nginx.conf
    - require:
      - pkg: nginx-server

nginx-service:
  service.running:
    - name: nginx
    - enable: True
