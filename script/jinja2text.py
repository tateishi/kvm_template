#! /usr/bin/python3
# -*- mode: python -*-

import sys
import uuid
import yaml
from jinja2 import Environment, Template, FileSystemLoader

def jinja2text(env, data_file, template_file):
    tmpl = env.get_template(template_file)
    with open(data_file) as file:
        data = yaml.load(file, Loader=yaml.SafeLoader)
    data = data['kvm']
    data['uuid'] = uuid.uuid4()
    return tmpl.render(data)

def main():
    env = Environment(loader=FileSystemLoader('.'))
    print(jinja2text(env, sys.argv[1], sys.argv[2]))

if __name__ == '__main__':
    main()
