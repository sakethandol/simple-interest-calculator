#!/bin/bash


echo "Simple Interest Calculator"
echo "========================="

echo -n "Enter Principal amount: "
read principal

echo -n "Enter Rate of interest (% per annum): "
read rate

echo -n "Enter Time period (in years): "
read time

if [[ ! $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values"
    exit 1
fi

simple_interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

echo ""
echo "Principal Amount: $principal"
echo "Rate of Interest: $rate% per annum"
echo "Time Period: $time years"
echo "Simple Interest: $simple_interest"
echo "Total Amount: $(echo "scale=2; $principal + $simple_interest" | bc)"
