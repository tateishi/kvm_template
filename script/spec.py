#! /usr/bin/python3
# -*- mode: python -*-

import sys
import uuid
import yaml
from jinja2 import Environment, Template, FileSystemLoader

spec_list = dict(small=['1', '512', '8G'],
                 medium=['2', '2048', '16G'],
                 large=['4', '4096', '40G'])

def inject_spec(data):
    if data['type'] in spec_list.keys():
        spec = spec_list[data['type']]
        data['cpus'] = spec[0]
        data['memory'] = spec[1]
        data['disk'] = spec[2]

def inject(data):
    inject_spec(data)

def jinja2text(env, data_file, template_file):
    tmpl = env.get_template(template_file)
    with open(data_file) as file:
        data = yaml.load(file, Loader=yaml.SafeLoader)
    data = data['spec']
    inject(data)
    return tmpl.render(data)

def main():
    env = Environment(loader=FileSystemLoader('.'))
    print(jinja2text(env, sys.argv[1], sys.argv[2]))

if __name__ == '__main__':
    main()

