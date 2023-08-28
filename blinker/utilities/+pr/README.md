<div align="center">
  <img src="/logo.svg" width="50%">
</div>

# EyeCatch
A fully automatic algorithm, implemented in MATLAB, for finding Eye-Related ICA components based on their scalpmaps and spectrum signatures (new). It has a performance comparable to CORRMAP while not requiring any user intervention. 

Here is a sample of eye-related ICA scalpmaps used in EyeCatch:

<div align="center">
  <img src="/eye_ic_scalpmaps.jpg" width="60%">
</div>


[Measure Projection Toolbox (MPT)](http://sccn.ucsd.edu/wiki/MPT) includes EyeCatch software (as pr.eyeCatch class), if you have not installed MPT you can download EyeCatch stand-alone from this repository.

## How to Reference

If you used EyeCatch, please include a reference to EyeCatch paper (below) in your publication :

[Bigdely-Shamlo, Nima, Kenneth Kreutz-Delgado, Christian Kothe, and Scott Makeig. "EyeCatch: Data-mining over half a million EEG independent components to construct a fully-automated eye-component detector." In Engineering in Medicine and Biology Society (EMBC), 2013 35th Annual International Conference of the IEEE, pp. 5845-5848. IEEE, 2013.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4136453)

## Usage

Note: if you have already installed Measure Projection software, please use `pr.eyeCatch` instead of `eyeCatch` in the examples below.
Example 1: Finding eye ICs in the EEG structure ().
```matlab
>> eyeDetector = eyeCatch;     % create an object from the class. Once you made an object it can
                                  % be used for multiple detections (much faster than creating an
                                  % object each time).
```
then
```matlab
>> [eyeIC similarity scalpmapObj] = eyeDetector.detectFromEEG(EEG); % detect eye ICs
>> eyeIC                          % display the IC numbers for eye ICs.
>> scalpmapObj.plot(eyeIC)        % plot eye ICs
```
Example 2: (application on a study)
```matlab    
 >> eyeDetector = eyeCatch;        % create an object from the class. Once you made an object it can
                                   % be used for multiple detections (much faster than creating an
                                   % object each time).
 % read data from a loaded study
 >> [isEye similarity scalpmapObj] = eyeDetector.detectFromStudy(STUDY, ALLEEG);
 >> find(isEye)                    % display the IC numbers for eye ICs (since isEye is a logical array). The order of ICs is same order as in STUDY.cluster(1).comps .
 >> scalpmapObj.plot(isEye)        % plot eye ICs
```

Created by Nima Bigdely-Shamlo, PhD.
