

# Transformation:
#     1. allows transform intensity values.

#     2. manipulating light and dark regions. --> depends on intensity value and transfer fnction used.

#     3. adjust the contrast for better visualization --> why we transform?

#     4. It is sometimes possible to see detail in an image that was not apparent --> imp --> this is why we transform.






setwd("~/My_Projects/R-prog/Neurohacking_data/kirby21/visit_1/113/")


T1 = readNIfTI("113-01-MPRAGE.nii.gz", reorient = FALSE)


im_hist<-hist(T1,plot=FALSE)

par(mar = c(5, 4, 4, 4) + 0.3)
col1=rgb(0,0,1,1/2)


plot(im_hist$mids,im_hist
     $count,log="y",type='h',lwd=10, lend=2,
     col=col1,xlab="Intensity Values",ylab="Count
(Log Scale)" ) 



#================ LINEAR TRANFORM FUNCTION ============

par(new = TRUE)
curve(x*1, axes = FALSE,xlab = "",ylab= "",
      col=2, lwd=3)
axis(side=4,at = pretty(range(im_hist$mids))/
       max(T1), labels=pretty(range(im_hist$mids)))
mtext("Original Intensity", side=4, line=2) 





#This defines a linear spline. Other definitions are possible
lin.sp<-function(x,knots,slope)
{knots<-c(min(x),knots,max(x))
slopeS<-slope[1]
for(j in 2:length(slope)){slopeS<-c(slopeS,slope[j]-
                                      sum(slopeS))}
rvals<-numeric(length(x))
for(i in 2:length(knots))
{rvals<-ifelse(x>=knots[i-1], slopeS[i-1]*(x-knots[i-1])+rvals, rvals)}
return(rvals)}

#Define a spline with two knots and three slopes
knot.vals<-c(.3,.6)


slp.vals<-c(1,.5,.25) 


par(new = TRUE)
curve(lin.sp(x,knot.vals,slp.vals),axes=FALSE,xlab="",ylab="",col=2,lwd=3)
axis(side=4,at = pretty(range(im_hist$mids))/
       max(T1),labels=pretty(range(im_hist$mids)))
mtext("Transformed Intensity", side=4, line=2) 


#knot values are re-scaled to value of intensities: by multiplying it with max
# value
trans_T1 <- lin.sp(T1, knot.vals * max(T1), slp.vals)

par(new = TRUE)
# Set up the plotting area to have 1 row and 2 columns
par(mfrow=c(1, 2))

# Plot the original image
image(T1, z=150, plot.type='single', main="Original Image")

# Plot the transformed image
image(trans_T1, z=150, plot.type='single', main="Transformed Image")

# Reset to default plotting parameters
par(mfrow=c(1, 1))



# --> try different types of transformation.

#Smoothing:
  # 1. apply gaussian function to smooth the image.
# 2. Smoothing in the context of image processing, and specifically 
# in neuroimaging, refers to the application of 
# a filter that averages the intensities of the
# image pixels or voxels within a local neighborhood

#3. Smoothing can make trends and important patterns in data more visible and easier to understand in graphical representations.
  

require(TCIU)
require(DT)

library(fslr)
smooth.T1 <- GaussSmoothArray(T1,voxdim=c(1,1,1),ksize=11, sigma=diag(3,3),  mask=NULL, var.norm=FALSE)
orthographic(smooth.T1) 



## What is difference between transformation and smoothing?

# 1. Smoothing is used to reduce noise and fluctuations in data to reveal underlying trends or patterns.
# 
# 2. Transformation is generally used to change the scale or distribution of the data. It can be applied to meet the assumptions of statistical models, normalize the data, 
# or enhance certain features for better interpretation or further analysis.





























