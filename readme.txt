To run the solver, first open the readXML.m function and ensure the file path is correctly set as per the instructions and examples in the comments.

For Problem A, the appropriate file is inputA.xml
For Problem B, the appropriate file is inputB.xml

These file names should be set in the initMaps.m script.

Ensure that the directory containing all included .m files is included in the matlabpath variable.

Run the main script from a clear workspace by entering the command >>run('main'); into the matlab command window. The stresses in each element and its tensile or compressive nature will be output. Forces can be seen by querying "globalForceVector" and displacements by querying "globalDisplacementVector".

Small errors may be present in these values (<<1%) because of decimal approximations of the angles the forces act at. 