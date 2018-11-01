FROM ubuntu:16.04

MAINTAINER Sungjin Lee <lsjhome@smfcast.com>

# 기존 미러 서버를 한국 서버로 변경

RUN sed -i 's/archive.ubuntu.com/ftp.neowiz.com/g' /etc/apt/sources.list

# git, curl 설치, pyenv 설치를 위한 파일 설치
RUN apt-get update
RUN apt-get install -y curl git
RUN apt-get install -y software-properties-common
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev

# 언어 팩 설치 및 설정, 시간 설치
RUN apt-get install -y language-pack-ko tzdata
RUN locale-gen en_US.UTF-8
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_MESSAGES en_US.utf8


# neovim 설치
RUN add-apt-repository -y ppa:neovim-ppa/stable && apt-get update && apt-get install -y neovim

# pyenv 설치 및 환경 변수 설정
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
RUN echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
RUN echo 'source ~/.bash_profile' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bash_profile"
RUN /bin/bash -c "source ~/.bashrc"
ENV PATH /root/.pyenv/bin:$PATH
# pyenv glboal로 설정
RUN pyenv install 3.6.4
RUN pyenv global 3.6.4

# rci_solution_api 복사, 왼쪽이 호스트 파일 경로 오른쪽이 컨테이너 파일 경로
COPY ./rci_solution_api /rci_solution_api

# rci_solution에 필요한 라이브러리들 설치
RUN cd /rci_solution_api && /root/.pyenv/shims/pip install -r requirements.txt

# uwsgi ini 파일 실행
# RUN cd /rci_solution_api/ && /root/.pyenv/shims/uwsgi --ini rci_solution_api.ini &
# RUN /root/.pyenv/shims/uwsgi --ini /rci_solution_api/rci_solution_api.ini

# nginx 설치
RUN apt-get install -y nginx

# nginx 설정파일 복사
COPY ./nginx.conf /etc/nginx/nginx.conf

# nginx 실행
# service nginx restar

# uwsgi, nginx 실행에 필요한 start.sh파일 복사
COPY ./start.sh /start.sh

# shell 파일을 통한 uwsgi 실행 및 nginx 실행

# CMD ["/root/.pyenv/shims/uwsgi", "--ini", "/rci_solution_api/rci_solution_api.ini"]
CMD ["/bin/bash", "/start.sh"]

EXPOSE 8080
