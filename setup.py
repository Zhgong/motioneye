from setuptools import setup

setup(
    name='send-bot',
    version='0.3',
    #py_modules=['cli_cmd', 'send_message'],
    packages=['send_bot'],
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
        send-bot=send_bot.cli_cmd:cli
    ''',
)


# try in venv:
# $ pip install --editable .
