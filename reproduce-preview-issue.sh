#!/bin/bash

PREVIEW_URL="https://www.facebook.com/ads/api/preview_iframe.php?d=AQLfStqbprGsFhvq-RTt4rAZPpaB42z-qlDH7wwLZA097JEXkfbk12IFSmuze6PfcaosfTz4PPEfGP7shfQ7bMrSjzK2IgveBsFuenmSKkYzJ8HhoJXpsQmdzbZxJFMxJ-CRbHlO_yhRl_sYUpLZbu19AIF5gQlfz7cy7PI9s5VwMqh-DHqlDGjHUESPF8aktobsVM3MK4NI4ikishDXl-i1EZsb9oWcbV25qg9HqoNsQN44pDcW9Tljdr1WhvCE4G-RJTAPyKkP6kj9khDrikTy9gJNnaeuSLWjqE0v48pfx034F7zNtSHbWGvoS62pgUfGIghrPHObPOyZcsUoFJqK&t=AQIHo-DpqqwvKz_eqUQ"

echo "##########################"
echo "# Initial Request (Should return status code 200)"
echo "##########################"
curl -I "$PREVIEW_URL"

echo ""
echo "##########################"
echo "# Requesting it 600 times"
echo "##########################"
printf "$PREVIEW_URL\n%.0s" {1..600} | xargs -P 20 -n 1 curl -s > /dev/null

echo ""
echo "##########################"
echo "# Next Request (Should return status code 200 but returns 302)"
echo "##########################"
curl -I "$PREVIEW_URL"