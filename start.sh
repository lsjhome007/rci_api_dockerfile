#!/bin/bash

# uwsgi ini 파일 실행
cd /rci_solution_api
chmod -R 777 .
/root/.pyenv/shims/uwsgi --ini /rci_solution_api/rci_solution_api.ini

# nginx 실행
service nginx restart

# bash 쉘 실행으로 docker 종료 방지
/bin/bash
