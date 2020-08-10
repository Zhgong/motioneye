import requests
from requests.auth import HTTPBasicAuth
from dotenv import load_dotenv
import os
load_dotenv()
MESSAGE_TOKEN = os.getenv("MESSAGE_TOKEN")
SERVER_IP = os.getenv("SERVER_IP")
PORT = os.getenv("PORT")



def send(message:str)->None:
    """ Send message via telegram bot"""
    if not MESSAGE_TOKEN:
        print(f"MESSAGE_TOKEN: {MESSAGE_TOKEN} is invalid")
        return
    elif not SERVER_IP:
        print(f"SERVER_IP: {SERVER_IP} is invalid")
        return
    elif not PORT:
        print(f"PORT: {PORT} is invalid")
        return

    auth = HTTPBasicAuth(MESSAGE_TOKEN, "")
    client = requests.post(f"https://{SERVER_IP}:{PORT}/api/v1/send", json={"message":str(message)}, auth=auth, verify=False)
    return client.text


if __name__ == "__main__":
    print(send("Just a test"))