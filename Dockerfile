FROM ubuntu:latest

COPY bin/ /usr/local/

RUN apt-get update \
    && apt-get install -y ansible  git \
    && git clone https://github.com/bearddan2000/ansible-lib-playbooks.git \
    && chmod -R +x ansible-lib-playbooks \
    && ansible-playbook ansible-lib-playbooks/lang/ruby/ruby-default.yml

CMD ["ruby", "/usr/local/main.sh"]
