

# contains working on a specific slice in a dicom image.

# Install the oro.dicom package if it's not already installed
if (!require("oro.dicom")) {
  install.packages("oro.dicom")
}

# Load the oro.dicom package
library(oro.dicom)




setwd("~/My_Projects/R-prog/Neurohacking_data/BRAINIX/DICOM/FLAIR")
slice = readDICOM("IM-0001-0011.dcm")



# Check the class of the 'slice' variable
class(slice)
# [1] "list"


# prints the names of the variables in the list. 
# output: hdr: diacom header, and the img: image
names(slice)


#getting the header of the slice.
class(slice$hdr)

# each element of header is dataframe
class(slice$hdr)


#will give list
class(slice$img)


# getting the image of the slice : matrix, array
class(slice$img[[1]])


dim(slice$img[[1]])


#getting dimensions
d = dim(t(slice$img[[1]]))



#set the color of the axis, and text to white.
par(col.axis="white", col.lab="white", col.main="white")



#printing the 1 slice of our dicom image.
image(1:d[1], 1:d[2], t(slice$img[[1]]), col=gray(0:64/64))


# Displaying a subset of the 'img' list element from the 'slice' list
slice$img[[1]][101:105, 121:125]







# Creating a histogram of the data from the first element of the 'img' list in 'slice'

# prob = true, makes it a density instead of count histogram, the flair, most the image is black, hence 
hist(slice$img[[1]], breaks = 50, xlab = "FLAIR", prob = TRUE,
     col = rgb(0, 0.8, 0, 0.5), main = "")







# taking the 1st element of the header.
hdr=slice$hdr[[1]]

#printing the values of the header.
names(hdr)



# Extracting the Pixel Spacing value from the DICOM header
pixel_spacing_value = hdr[hdr$name == "PixelSpacing", "value"]

#each pixes is X x Y doimesion, it's tells us about resolution of the image
print( pixel_spacing_value)

# Extracting the Flip Angle value from the DICOM header
flip_angle_value =  hdr[hdr$name == "FlipAngle", ]









# print(my_list$age)              # Prints the age
# print(my_list$name)             # Prints the name
# print(my_list$scores)           # Prints the scores vector
# print(my_list$passed)   