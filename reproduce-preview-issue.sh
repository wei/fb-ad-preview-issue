#!/bin/bash

PREVIEW_URL="https://www.facebook.com/ads/api/preview_iframe.php?d=AQI4Chq-DOFkCDd3v-vlomF1KDwUST8geg5cjFXp8nz0qMr-ocTWPYU1_h5X3hxlruldPhFEopk9xPe24wuPX4cdmGW1iPdIrGRrUizOC8hJmvQxY9adw4h9RUhd_eFULGDwEvUez9Sgs_kHtqth7WDeLMYCCdYho4r3vH8m4SVpcNsW7PZQ7fZA2nDshwcqBHhFVum4s7-oB7Ns6-26fkei_9VEBeLN0dT9mTFq2wQr0b5wlGb2rawP8a2qrQYPGqxU6JuCo8By4hIoHjagrT7QxTGfx4G8Ppqm9jLibqhdf8uDEFiCjRt4XxuEWorFuV2hA06jCJRVT9eXh5V3wNW2&t=AQLKjLbTWQxj0wmAXcc"

echo "##########################"
echo "# Initial Request (Should return status code 200)"
echo "##########################"
curl -s -I "$PREVIEW_URL"

echo ""
echo "##########################"
echo "# Requesting 800 times. Please wait..."
echo "##########################"
printf "$PREVIEW_URL\n%.0s" {1..800} | xargs -P 20 -n 1 curl -s > /dev/null

echo ""
echo "##########################"
echo "# Next Request (Should return status code 200 but returns 302)"
echo "##########################"
curl -s -I "$PREVIEW_URL"
