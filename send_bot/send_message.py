import requests
from requests.auth import HTTPBasicAuth
from dotenv import load_dotenv
import os
load_dotenv()
MESSAGE_TOKEN = os.getenv("MESSAGE_TOKEN")
SERVER_IP = os.getenv("SERVER_IP")
PORT = os.getenv("PORT")

auth = HTTPBasicAuth(MESSAGE_TOKEN, "")

def send(message:str)->None:
    """ Send message via telegram bot"""
    client = requests.post(f"https://{SERVER_IP}:{PORT}/api/v1/send", json={"message":str(message)}, auth=auth, verify=False)
    return client.text


if __name__ == "__main__":
    print(send("Just a test"))