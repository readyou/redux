#! /bin/bash

# gitbook build
gitbook pdf . books/redux-documentation.pdf
gitbook mobi . books/redux-documentation.mobi

chmod +x ./doc2set.py
./doc2set.py
