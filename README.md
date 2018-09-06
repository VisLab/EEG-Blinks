# EEG-Blinks
Tools for analyzing eye blinks from EEG data

Contains tools for the BLINKER pipeline for automatically extracting blinks and related
ocular indices from EEG. You can find user documention at: 
   http://vislab.github.io/EEG-Blinks/   
   
**Note:** For convenience, EEGLABPlugin directory contains the latest released version of BLINKER
that can be unzipped into your EEGLAB plugins directory.  

### Citing the BLINKER pipeline
BLINKER is freely available under the GNU General Public License. 
Please cite the following publication if using:  
> Kleifges K, Bigdely-Shamlo N, Kerick S, and Robbins KA  
> BLINKER: Automated extraction of ocular indices from EEG enabling large-scale analysis. 
> Front. Neurosci. 11:12. doi: 10.3389/fnins.2017.00012.  
> [http://journal.frontiersin.org/article/10.3389/fnins.2017.00012/abstract](http://journal.frontiersin.org/article/10.3389/fnins.2017.00012/abstract)  
>  

### People
The primary developers of BLINKER are Kelly Kliefgas and Kay Robbins of UTSA. BLINKER also 
uses Eye-Catch developed by Nima Bigdely-Shamlo while at USCS SCCN to eliminate 
independent components that are not eye-related. Kay Robbins of UTSA maintains BLINKER.

### Releases  
1.0.1  2/22/2017 Implemented combine-by-subject and date for determining max distributions 
1.0.2  3/9/2017 Implemented insertion of blink events into EEG structure
1.1.0  3/17/2017 Implemented insertion of additional blink features as events and constructed zeroed blink signal
1.1.1  9/6/2018 Modified getBlinkEvents to not include leading slashes in HED tags

### Support  
This research was sponsored by the Army Research Laboratory and was  
accomplished under Cooperative Agreement Number W911NF-10-2-0022.  
The views and conclusions contained in this document are those of  
the authors and should not be interpreted as representing the official  
policies, either expressed or implied, of the Army Research Laboratory  
or the U.S. Government. The U.S. Government is authorized to reproduce  
and distribute reprints for Government purposes notwithstanding any  
copyright notation herein.  