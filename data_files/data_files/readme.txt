
Data files for digital signal processing exercises

The data files can be loaded into MATLAB using the command:

x = load('signal1.txt');

-------------------------------------------

signal1 - bird
	Sampling rate: 8192 Hz
	Length: 600 samples

signal2 - sinusoids

signal3 - chorus plus click
	Sampling rate: 8192 Hz

signal4 - EOG signal

signal5 - polynomial signal 
  	This is not a txt file.
	Load using command, 'x = signal5;'

arctic_a0001.wav
	Sentence spoken by adult male
	load using
	>> [x, Fs] = wavread('arctic_a0001.wav');

	Source: http://www.speech.cs.cmu.edu/cmu_arctic/cmu_us_bdl_arctic/wav/


ECG_Fs256.txt
	Simulated ECG signal with sampling rate Fs = 256 Hz.
	Produced using ECG simulation software, ECGSYN:
	http://www.physionet.org/physiotools/ecgsyn/
	P. E. McSharry, G. D. Clifford, L. Tarassenko, and L. A. Smith.
	A dynamical model for generating synthetic electrocardiogram signals.	Trans. on Biomed. Eng., 50(3):289–294, March 2003.	

IMG_2616.jpg
	photographic color image 
	size = [1200 1600] pixels
	load using
	>> a = imread('IMG_2616.jpg');
	>> x = rgb2gray(a);

-------------------------------------------


