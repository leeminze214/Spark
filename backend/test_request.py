import requests, argparse

parser = argparse.ArgumentParser(description="make a simple post request")
parser.add_argument("data")
args = parser.parse_args()

url = "http://localhost:5000/test"
data = args.data

response = requests.post(url, data=data)

print("you sent:", response.text)