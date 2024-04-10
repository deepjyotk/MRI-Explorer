# Setting the working directory to the location of the DICOM files
setwd("~/My_Projects/R-prog/Neurohacking_data/BRAINIX/DICOM")

# Reading the DICOM files located in the T1 directory
all_slices_T1 = readDICOM("T1/")

# Getting the dimensions of the first image slice
dimensions = dim(all_slices_T1$img[[11]])
print(dimensions)

# Extracting the header information of the first DICOM file
hdr = all_slices_T1$hdr[[11]]

# Accessing the 'PixelSpacing' value from the header
pixel_spacing = hdr[hdr$name == "PixelSpacing", "value"]
print(pixel_spacing)


#convert dicom to nifti.
nii_T1 = dicom2nifti(all_slices_T1)


d = dim(nii_T1);d;class(nii_T1)


image(1:d[1] , 1:d[2] , nii_T1[,,11],col=gray(0:64/64), xlab = "" , ylab="")



#//////////////////////////
# now, we have all our DICOM Files, and also have convert to NII and is stored in nii_T1,
#below we will convert store it on disk, using writeNIFTI, and it will be stored as:Output_3D_File.nii.gz
#//////////////////////////



# Load the oro.nifti library
library(oro.nifti)

# Set the working directory to where the NIfTI files are located
setwd("~/My_Projects/R-prog/Neurohacking_data/BRAINIX/NIFTI")

# Specify the filename for the output NIfTI file
fname <- "Output_3D_File"

# Write the NIfTI file to disk
writeNIfTI(nim=nii_T1, filename=fname)

# List files in the current working directory with a specific pattern
list.files(getwd(), pattern = "Output_3D_File")

# Output might be: "Output_3D_File.nii.gz"




# List NIfTI files in the current working directory
list.files(getwd(), pattern = "T")

# Output might be: "T1.nii.gz" "T2.nii.gz"




# Read a NIfTI file from the disk
nii_T2 <- readNIfTI("T2.nii.gz", reorient=FALSE)

# Get the dimensions of the NIfTI data
dim(nii_T2)