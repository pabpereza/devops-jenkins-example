import requests


def curl(url):
    r = requests.get(url)
    
    return r.content
print("hola");
print( "Prueba caché docker")
print( curl("https://www.yahoo.com"))
