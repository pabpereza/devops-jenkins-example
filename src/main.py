import requests


def curl(url):
    r = requests.get(url)
    
    return r.content

print( "Prueba caché docker")
print( curl("https://www.google.com"))
