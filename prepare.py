import jinja2

ARGS = {
    'node_versions': [
        ('14', '14.21.3'),
        ('16', '16.20.2'),
        ('18', '18.20.8'),
        ('20', '20.19.0'),
        ('22', '22.14.0'),
    ],
    'apt_packages': [
        'build-essential',
        'ca-certificates',
        'locales',
        'locales-all',
        'git',
        'curl',
        'openjdk-21-jdk-headless',
        'openssh-client',
        'python3',
        'python3-pip',
        'python3-venv',
        'rsync',
        'tini',
        'tzdata',
        'unzip',
    ]
}

ARGS['apt_packages'].sort()


def main():
    with open('Dockerfile.jinja2') as f:
        template = jinja2.Template(f.read())

    with open('Dockerfile', 'wb') as f:
        f.write(template.render(**ARGS).encode('utf-8'))


if __name__ == "__main__":
    main()
