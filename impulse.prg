' Create a new series to store the impulse response of PBI_G
series PBI_G_ON_PBI_G_local_projection = na

' Loop through the periods
for !t = 6 to 20
    ' Estimate the regression model
    equation eq1.ls var2_PBI_G_est c var2_PBI_G_est(-1 to -2) var2_SPREAD_est(-1 to -2)
    
    ' Obtain the coefficient for PBI_G(-1)
    scalar co1 = eq1.@coef("PBI_G_est[-1]")
   
    ' Store the coefficient in the PBI_G_response series
    PBI_G_ON_PBI_G_local_projection(!t) = co1

    ' Drop the equation object
    delete(eq1)
next
