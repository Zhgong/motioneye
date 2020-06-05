from setuptools import setup

setup(
    name='send-bot',
    version='0.1',
    py_modules=['cli_cmd'],
    install_requires=[
        'certifi',
        'chardet',
        'click',
        'idna',
        'python-dotenv',
        'requests',
        'urllib3',
    ],
    entry_points='''
        [console_scripts]
        send-bot=cli_cmd:cli
    ''',
)


# try in venv:
# $ pip install --editable .