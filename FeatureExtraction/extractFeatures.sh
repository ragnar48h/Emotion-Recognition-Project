#!/bin/sh

rm -r features
mkdir features
# Intensity and Pitch features using Praat
praat main.psc
# Energy features using Python
python3 energy_extraction.py
# Speech Rate using Python
python3 SR_extraction.py
# Concatenate different features
python3 concatFeatures.py