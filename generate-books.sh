#! /bin/bash

if [[ $1 == 'book' ]]; then
    # gitbook build
    gitbook pdf . books/redux-documentation.pdf
    gitbook mobi . books/redux-documentation.mobi
    exit
fi;

if [[ $1 == 'docset' ]]; then
    rm -rf ./books
    gitbook build
    rm -rf ./redux.docset/Contents/Resources/Documents/*
    rm redux.docset/Contents/Resources/docSet.dsidx
    # for file in 'build' 'docs' 'gitbook' 'index.html' 'PATRONS.html'; do
    #     cp -r "./books/${file}" ./redux.docset/Contents/Resources/Documents
    # done;
    for file in $(find ./books -maxdepth 1 ! -name redux.docset); do
        cp -r "${file}" ./redux.docset/Contents/Resources/Documents
    done
    rm -rf ./books

    chmod +x ./doc2set.py
    ./doc2set.py
    open redux.docset
    exit
fi;

echo 'Usage ./generate-books.sh book|docset'
