import jinja2

ARGS = {
    'node_versions': [
        ('14', '14.21.3'),
        ('16', '16.20.2'),
        ('18', '18.20.8'),
        ('20', '20.19.0'),
        ('22', '22.14.0'),
    ],
    'maven_versions': [
        ('3.6', '3.6.3'),
        ('3.8', '3.8.8'),
        ('3.9', '3.9.9'),
    ],
    'jdk_versions': [
        ('8',
         'https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u442-b06/OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz'),
        ('11',
         'https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.26%2B4/OpenJDK11U-jdk_x64_linux_hotspot_11.0.26_4.tar.gz'),
        ('17',
         'https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.9%2B9/OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz'),
        ('21',
         'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.6%2B7/OpenJDK21U-jdk_x64_linux_hotspot_21.0.6_7.tar.gz'),
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
        'fontconfig',
        'libharfbuzz-dev',
        'libglib2.0-dev',
        'libgraphite2-dev',
        'libpcre2-dev',
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
