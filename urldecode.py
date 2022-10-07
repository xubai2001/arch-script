#!/usr/bin/python3

import urllib.parse
from os import system

def urldecode(url):
    result = urllib.parse.unquote(url)
    return result

def urlencode(url):
    result = urllib.parse.quote_plus(url)
    return result

def main():
    try:
        method, url = input("接码(d) 编码(e) url:\n").split()
    except KeyboardInterrupt:
        print("cancel")
    except ValueError:
        print("invalid error！")
    else:
        if method == 'd':
            result = urldecode(url)
        elif method == 'e':
            result = urlencode(url)
        else:
            print("valid method！")
            return
        print(result)
        system("echo %s | xclip -selection clipboard" % result)


if __name__ == "__main__":
    main()
