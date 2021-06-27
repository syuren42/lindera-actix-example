import json
import urllib.request

url = 'http://lindera-api-cluster.example:8080/api/v1/tokenize'

def lambda_handler(event,context):
    data = {
        'sentense': '吾輩わがはいは猫である。名前はまだ無い。どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。',
    }
    headers = {
        'Content-Type': 'application/json',
    }

    req = urllib.request.Request(url, json.dumps(data).encode(), headers)
    with urllib.request.urlopen(req) as res:
        body = res.read()
        print(json.loads(body))

# for Local debug
if __name__ == '__main__':
    lambda_handler(None,None)
