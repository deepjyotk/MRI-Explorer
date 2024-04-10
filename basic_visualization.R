setwd("~/My_Projects/R-prog/Neurohacking_data/BRAINIX/NIFTI")

fname  = "Output_3D_File"


# ==========
# Dimension       : 512 x 512 x 22
# what does this means? rows x cols x slices


# A Nifty file is : rows x cols x slices 3D matrix.
#=========

print({nii_T1 = readNIfTI(fname = fname)})

d = dim(nii_T1)


# == Default R image function plotting 
# 1:512, 1:512, get the slice 11th, no labels.
image(1:d[1] , 1:d[2] , nii_T1[,,11] , xlab = "", ylab = "")
heat.colors(12)



#== "or:nifti" package image function uses default: gray scale pallete.
image(nii_T1, z=11,plot.type = "single")
# get the 11th slice.


#==  Visualize all the slices
image(nii_T1)



#other view: will give 
# 1. axial: side se cut,
# 2. sagital:aage se [front]
# 3. cornal:  upar se
#200:x ,200=y, zthslice = 11
# shows all 3 directions together.
orthographic(nii_T1, xyz = c(200,200,11))







#=========== Visualizing all slices - Histogram: density vs intensity

# par(mfrow=c(1,2));
# par(col.axis="white", col.lab="white", col.main="white");
par(bg="white", col.axis="black", col.lab="black", col.main="black")

# o <- par(mar=c(4,4,0,0))
hist(nii_T1, breaks = 75, prob=T, xlab="T1 intensities", col=rgb(0,0,1,0.5), main="");
hist(nii_T1[nii_T1 > 20], breaks = 75, prob=T, xlab="T1 intensities > 20", col=rgb(0,0,1,1/2), main="")




# =========== MASK Visualization =======================================
#Visualizing the white matter of the brain: 
# 1. intensities between 300 and 400, masking it and visualizing it using overlay or orthographic function.


# Create a logical vector that is TRUE where nii_T1 voxel values are between 300 and 400
is_btw_300_400 <- (nii_T1 >300 ) & (nii_T1 < 400)

# Copy the nii_T1 data to a new variable for masking
nii_T1_mask <- nii_T1

# Mask out values that are not between 300 and 400 by setting them to NA
nii_T1_mask[!is_btw_300_400] <- NA


# Overlay the original image and the mask, and display the 11th slice in single plot type
overlay(nii_T1, nii_T1_mask, z=11, plot.type="single")



#orthographic view of the masked image.
orthographic(nii_T1, nii_T1_mask, xyz = c(200,220,11), text = "Image overlaid with mask.")

























