#!/bin/bash

ansible-playbook -i "127.0.0.1," --connection=local --extra-vars "target=127.0.0.1" --tags ${1} /vagrant/ansible/provision.yml
