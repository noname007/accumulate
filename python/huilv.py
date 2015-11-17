from urllib.request import urlopen;
# import 
webpage = urlopen('http://qq.ip138.com/hl.asp?from=GBP&to=USD&q=100');
print(webpage)