# arPLS-adaptation
Uses arPLS from: https://github.com/heal-research/arPLS as a custom fitting solution for data output from a Raman system.

Danial Ahmad

UR Nano

arPLS_processor uses a fitting algorithm called arPLS for Raman spectra baseline correction. This code is designed to be used with output from Berger Lab's Raman microscope system. It can be modified for other files from other microscopes by editing the ascProc.wls file.

Right now this is designed to work with macOS Catalina 10.15.3

Citation for arPLS:

Sung-June Baek,  Aaron Park,  Young-Jin Ahna and Jaebum Choo:
"Baseline correction using asymmetrically reweighted penalized least
squares smoothing", Analyst, 2015,140, 250-257 
https://github.com/heal-research/arPLS

Prerequisites:
1. Install xcode command line tools via terminal: xcode-select --install
2. Install homebrew via terminal: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
3. Install gcc via termainal: brew install gcc
4. Make arPLS using the included makefile in the arPLS-master directory. Point terminal to that directory with "cd ~/PathToDirectoryHere" and type in "make arPLS". Remember to get arPLS from https://github.com/heal-research/arPLS
5. Take the arPLS UNIX executable and place it in the arPLS_processor main directory
6. Have the latest version of Wolfram Mathematica and Wolframscript installed

Instructions:
1. Place .asc files obtained from the microscope in the folder labeled "RawData".
2. Click the file labeled "Run" to run the script.
3. All important data and figures will be generated and left in folders.

Troubleshooting:
1. If "Run" can't execute, you might need to run chmod on "ascProc.wls" and "ascPlotter.wls". Point terminal to the arPLS_processor directory and run "chmod +x ascProc.wls" and "chmod +x ascPlotter.wls".
2. Anything else email me: sahmad12@ur.rochester.edu
