# MRI Data Analysis with R

This repository contains R scripts for performing data analysis on MRI (Magnetic Resonance Imaging) data. The scripts leverage various R packages such as `oro.dicom`, `oro.nifti`, and `fslr` for reading, visualizing, and manipulating MRI data.

## Project Structure

```
|- DICOM/
   |- basic_visualization.R
   |- ...
|- NIFTI/
   |- transformation_and_smoothing.R
   |- ...
|- README.md
```

- **DICOM**: Contains R scripts for working with DICOM (Digital Imaging and Communications in Medicine) format MRI data.
- **NIFTI**: Contains R scripts for working with NIfTI (Neuroimaging Informatics Technology Initiative) format MRI data.
- **README.md**: This file, providing an overview of the project.

## Usage

1. Clone the repository to your local machine:

```
git clone https://github.com/your-username/mri-data-analysis-r.git
```

2. Install the required R packages if not already installed:

```R
install.packages(c("oro.dicom", "oro.nifti", "fslr", "TCIU", "DT"))
```

3. Navigate to the desired directory (`DICOM/` or `NIFTI/`) containing the scripts.

4. Run the R scripts in your preferred R environment (e.g., RStudio) by executing the commands within each script.

## Scripts Overview

### DICOM

- **basic_visualization.R**: Provides scripts for basic visualization of DICOM images including histogram plotting, overlaying masks, and performing transformations.

### NIFTI

- **transformation_and_smoothing.R**: Demonstrates scripts for transforming and smoothing NIfTI format MRI images, including intensity transformation and Gaussian smoothing.

## Dependencies

- `oro.dicom`: For reading and manipulating DICOM format MRI data.
- `oro.nifti`: For reading and manipulating NIfTI format MRI data.
- `fslr`: For additional image processing functionalities.
- `TCIU`: For Gaussian smoothing of MRI images.
- `DT`: For generating histograms and visualizing image data.

---
