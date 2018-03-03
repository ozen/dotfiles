#!/usr/bin/env python3
import sys
import json
import urllib.request

def get_rate(from_cur, to_cur):
    with urllib.request.urlopen('https://api.coinmarketcap.com/v1/ticker/?convert={0}'.format(to_cur)) as response:
        data = response.read().decode("utf-8")
        data_dict = json.loads(data)

        for cur in data_dict:
            if cur['symbol'].lower() == from_cur:
                rate = cur['price_{0}'.format(to_cur)]
                return float(rate)
        
    return None

def main():
    if len(sys.argv) != 4:
        sys.exit('Usage: {0} <amount> <from> <to>'.format(sys.argv[0]))

    amount = int(sys.argv[1])
    from_cur = sys.argv[2].lower()
    to_cur = sys.argv[3].lower()

    rate = get_rate(from_cur, to_cur)

    if rate is None:
        rate = get_rate(to_cur, from_cur)

        if rate is None:
            sys.exit('Could not find the answer')
        else:
            print(amount/rate)
    else:
        print(amount*rate)


if __name__ == "__main__":
    main()
