# 5G-Flexible-Transceiver-for-Physical-Layer-Evaluation
## Basic overview
The aim of this proposal is to extend the flexible PHY software component made available
by the eWINE project with MIMO technologies. The goal is to utilize the second independent RF
chain of the USRP SDR to employ Alamouti space-time coding (STC) combined with GFDM. This
technique, firstly introduced for OFDM based wireless transmission systems, increases the reliability
of the data transfer by transmitting multiply copies of the data stream. However, it has not yet been
applied on the GFDM flexible waveform generation framework and, since GFDM is a nonorthogonal
waveform, its combination with STC is not a straight forward approach.

![Alt text](https://user-images.githubusercontent.com/24733570/31706074-fdd27832-b3e7-11e7-9ffe-a791747338fd.png)
![Alt text](https://user-images.githubusercontent.com/24733570/31706190-5ff0c38e-b3e8-11e7-9b8b-54a9972795fe.png)
## GFDM Library - How to use 
In this library, only basic functions for GFDM transmission, signal generation, and naive reception are included, nothing fancy like channel estimation/equalization, iterative receivers, etc.
The functions are grouped into several parts:

* get_* These functions return objects that are commonly used for GFDM simulations.
* calc_* These functions calculate (not only) performance values based on the passed objects.
* do_* These more complex functions do actual simulation steps.
``` Remark: To use the library functions, you must include the library folder and subfolders to the MATLAB path.
