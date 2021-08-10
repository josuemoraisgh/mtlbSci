/*
 * -------------------------------------------------------------------------
 * validate.c -- Input validation function
 * SWT - Scilab wavelet toolbox
 * Copyright (C) 2005-2006  Roger Liu
 * Copyright (C) 20010-2012  Holger Nahrstaedt
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * -------------------------------------------------------------------------
 */

//#include "swt_common.h"
//#include "dwt.h"
#include "swtlib.h"
#include "swt_gwsupport.h"
#include "api_scilab.h"
//#include "stack-c.h"
#include "Scierror.h"
//#include "localization.h"
//#include "warningmode.h"
#include "sciprint.h"


int swt_gwsupport_GetRealMatrixOfDoubles(void* pvApiCtx, char * fname, int ivar, int * _piRows , int * _piCols, double** _pdblReal )
{
  int iType = 0;
  int iComplex = 0;
  SciErr sciErr;
  int *_piAddress;
  int type;

  sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
  if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return SWT_GWSUPPORT_ERROR;
    }
    sciErr = getVarType(pvApiCtx, _piAddress, &type);
    if(sciErr.iErr)
      {
        printError(&sciErr, 0);
        return SWT_GWSUPPORT_ERROR;
      }
      if (type!=sci_matrix)
        {
          Scierror (999,"%s: %d input vector must be double\n",ivar,fname);
          return SWT_GWSUPPORT_ERROR;
        }
    sciErr = getMatrixOfDouble(pvApiCtx, _piAddress, _piRows, _piCols, _pdblReal);
    if(sciErr.iErr)
      {
        printError(&sciErr, 0);
        return SWT_GWSUPPORT_ERROR;
      }
      return SWT_GWSUPPORT_OK;
}


int swt_gwsupport_GetComplexMatrixOfDoubles( void* pvApiCtx, char * fname, int ivar, int * _piRows , int * _piCols, double** _pdblReal , double** _pdblImag )
{
  int iType = 0;
  int iComplex = 0;
  SciErr sciErr;
  int *_piAddress;
  int type;

  sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
  if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return SWT_GWSUPPORT_ERROR;
    }
    sciErr = getVarType(pvApiCtx, _piAddress, &type);
    if(sciErr.iErr)
      {
        printError(&sciErr, 0);
        return SWT_GWSUPPORT_ERROR;
      }
      if (type!=sci_matrix)
        {
          Scierror (999,"%s: %d input vector must be double\n",ivar,fname);
          return SWT_GWSUPPORT_ERROR;
        }
        sciErr = getComplexMatrixOfDouble(pvApiCtx, _piAddress, _piRows, _piCols, _pdblReal,_pdblImag);
        if(sciErr.iErr)
          {
            printError(&sciErr, 0);
            return SWT_GWSUPPORT_ERROR;
          }
          return SWT_GWSUPPORT_OK;
        }


int swt_gwsupport_GetRealMatrixOfDoublesAsInteger( void* pvApiCtx, char * fname, int ivar, int * _piRows , int * _piCols, int** _pdblReal )
{
  int iType = 0;
  int iComplex = 0;
  SciErr sciErr;
  int *_piAddress;
  int type;

  sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
  if(sciErr.iErr)
    {
      printError(&sciErr, 0);
      return SWT_GWSUPPORT_ERROR;
    }
    sciErr = getVarType(pvApiCtx, _piAddress, &type);
    if(sciErr.iErr)
      {
        printError(&sciErr, 0);
        return SWT_GWSUPPORT_ERROR;
      }
      if (type!=sci_matrix)
        {
          Scierror (999,"%s: %d input vector must be double\n",ivar,fname);
          return SWT_GWSUPPORT_ERROR;
        }
    sciErr = getMatrixOfDoubleAsInteger(pvApiCtx, _piAddress, _piRows, _piCols, _pdblReal);
    if(sciErr.iErr)
      {
        printError(&sciErr, 0);
        return SWT_GWSUPPORT_ERROR;
      }
      return SWT_GWSUPPORT_OK;
    }

    int swt_gwsupport_GetRealHypermatofdouble( void* pvApiCtx, char * fname, int ivar, int ** _dims , int *_ndims, double** _pdblReal )
    {
      int iType = 0;
      int iComplex = 0;
      SciErr sciErr;
      int *_piAddress;
      int type;

      sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
      if(sciErr.iErr)
        {
          printError(&sciErr, 0);
          return SWT_GWSUPPORT_ERROR;
        }
        sciErr = getHypermatOfDouble(pvApiCtx, _piAddress, _dims, _ndims, _pdblReal);
        if(sciErr.iErr)
          {
            printError(&sciErr, 0);
            return SWT_GWSUPPORT_ERROR;
          }
          return SWT_GWSUPPORT_OK;
        }
    // int swt_gwsupport_GetRealMatrixOfUnsignedInteger16( void* pvApiCtx, char * fname, int ivar, int * _piRows , int * _piCols, unsigned short** _pusData16 )
    // {
    //   SciErr sciErr;
    //   int *_piAddress;
    //   int type;
    //
    //   sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
    //   if(sciErr.iErr)
    //     {
    //       printError(&sciErr, 0);
    //       return SWT_GWSUPPORT_ERROR;
    //     }
    //     // sciErr = getVarType(pvApiCtx, _piAddress, &type);
    //     // if(sciErr.iErr)
    //     //   {
    //     //     printError(&sciErr, 0);
    //     //     return SWT_GWSUPPORT_ERROR;
    //     //   }
    //       // if (type!=sci_matrix)
    //       //   {
    //       //     Scierror (999,"%s: %d input vector must be double\n",ivar,fname);
    //       //     return SWT_GWSUPPORT_ERROR;
    //       //   }
    //         SciErr = getMatrixOfUnsignedInteger16(pvApiCtx, _piAddress, _piRows, _piCols, _pusData16);
    //         if(sciErr.iErr)
    //           {
    //             printError(&sciErr, 0);
    //             return SWT_GWSUPPORT_ERROR;
    //           }
    //           return SWT_GWSUPPORT_OK;
    //         }
    char ** swt_gwsupport_GetMatrixOfString( void* pvApiCtx, char * fname, int ivar, int * _piRows , int * _piCols)
    {
      SciErr sciErr;
      int *_piAddress;
      int *_piLen=NULL;
      char ** _pstStrings=NULL;
      int type;
      int i;

      sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
      if(sciErr.iErr)
        {
          printError(&sciErr, 0);
          return NULL;
        }


        sciErr = getVarType(pvApiCtx, _piAddress, &type);
        if(sciErr.iErr)
          {
            printError(&sciErr, 0);
            return NULL;
          }
          // if (type!=sci_string)
          //   {
          //     Scierror (999,"%s: %d input vector must be double\n",ivar,fname);
          //     return SWT_GWSUPPORT_ERROR;
          //   }
            //first call to retrieve dimensions
            sciErr = getMatrixOfString(pvApiCtx, _piAddress, _piRows, _piCols, NULL, NULL);
            if(sciErr.iErr)
              {
                printError(&sciErr, 0);
                return NULL;
              }
              //sciprint("dim %d x %d",(*_piRows),(*_piCols));
              _piLen = (int*)malloc(sizeof(int) * (*_piRows) * (*_piCols));
              //second call to retrieve length of each string
              sciErr = getMatrixOfString(pvApiCtx, _piAddress, _piRows, _piCols, _piLen, NULL);
              if(sciErr.iErr)
                {
                  printError(&sciErr, 0);
                  return NULL;
                }

                _pstStrings = (char**)malloc(sizeof(char*) * (*_piRows) * (*_piCols));
                for(i = 0 ; i < (*_piRows) * (*_piCols) ; i++)
                  {
                    //sciprint("i %d length %d",i,_piLen[i] + 1);
                    _pstStrings[i] = (char*)malloc(sizeof(char) * (_piLen[i] + 1));//+ 1 for null termination
                  }


                //third call to retrieve data
                sciErr = getMatrixOfString(pvApiCtx, _piAddress, _piRows, _piCols, _piLen, _pstStrings);
                //sciprint("str 1  %c 2 %c",_pstStrings[0][0],_pstStrings[1][0]);
                free (_piLen);
            if(sciErr.iErr)
              {
                printError(&sciErr, 0);
                return NULL;
              }
              return _pstStrings;
            }


    int swt_gwsupport_GetScalarString( void* pvApiCtx, char * fname, int ivar , char** mystring )
    {
      int *_piAddress;
      int iRet = 0;
      SciErr sciErr;

      sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
      if(sciErr.iErr)
        {
          printError(&sciErr, 0);
          return SWT_GWSUPPORT_ERROR;
        }
        iRet = getAllocatedSingleString(pvApiCtx, _piAddress, mystring);
        if (iRet)
          {
            Scierror(999,"%s: Wrong type for input argument #%d: Single string expected.\n", fname,ivar);
            return SWT_GWSUPPORT_ERROR;
          }
          return SWT_GWSUPPORT_OK;
        }

        int swt_gwsupport_AllocMatrixOfDoubles ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , double ** _pdblReal )
        {
          SciErr sciErr;
          sciErr = allocMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, _pdblReal);
          if(sciErr.iErr)
            {
              printError(&sciErr, 0);
              return SWT_GWSUPPORT_ERROR;
            }
            AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
            return SWT_GWSUPPORT_OK;
          }

          int swt_gwsupport_AllocComplexMatrixOfDoubles ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , double** _pdblReal, double** _pdblImg )
          {
            SciErr sciErr;
            sciErr = allocComplexMatrixOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, _pdblReal,_pdblImg);
            if(sciErr.iErr)
              {
                printError(&sciErr, 0);
                return SWT_GWSUPPORT_ERROR;
              }
              AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
              return SWT_GWSUPPORT_OK;
            }

          int swt_gwsupport_AllocMatrixOfDoublesAsInteger ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , int ** _pdblReal )
          {
            SciErr sciErr;
            sciErr = allocMatrixOfDoubleAsInteger(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, _pdblReal);
            if(sciErr.iErr)
              {
                printError(&sciErr, 0);
                return SWT_GWSUPPORT_ERROR;
              }
              AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
              return SWT_GWSUPPORT_OK;
            }
            int swt_gwsupport_AllocMatrixOfUnsignedInteger16 ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , unsigned short** _pusData16)
            {
              SciErr sciErr;
              sciErr = allocMatrixOfUnsignedInteger16(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, _pusData16);
              if(sciErr.iErr)
                {
                  printError(&sciErr, 0);
                  return SWT_GWSUPPORT_ERROR;
                }
                AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
                return SWT_GWSUPPORT_OK;
              }
              int swt_gwsupport_AllocMatrixOfInteger32 ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , int** _piData32)
              {
                SciErr sciErr;
                sciErr = allocMatrixOfInteger32(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, _piData32);
                if(sciErr.iErr)
                  {
                    printError(&sciErr, 0);
                    return SWT_GWSUPPORT_ERROR;
                  }
                  AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
                  return SWT_GWSUPPORT_OK;
                }
            int swt_gwsupport_CreateMatrixOfString ( void* pvApiCtx, char * fname, int ovar , int _piRows , int _piCols , char ** pstData )
            {
              SciErr sciErr;
              sciErr = createMatrixOfString(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, _piRows, _piCols, pstData);
              if(sciErr.iErr)
                {
                  printError(&sciErr, 0);
                  return SWT_GWSUPPORT_ERROR;
                }
                free(pstData);
                AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
                return SWT_GWSUPPORT_OK;
              }

              int swt_gwsupport_CreateHypermatOfDouble ( void* pvApiCtx, char * fname, int ovar , int* dims , int ndims, double* pdblReal)
              {
                SciErr sciErr;
                sciErr = createHypermatOfDouble(pvApiCtx, nbInputArgument(pvApiCtx) + ovar, dims, ndims, pdblReal);
                if(sciErr.iErr)
                  {
                    printError(&sciErr, 0);
                    return SWT_GWSUPPORT_ERROR;
                  }
                  //free(pdblReal);
                  AssignOutputVariable(pvApiCtx,ovar) = nbInputArgument(pvApiCtx)+ovar;
                  return SWT_GWSUPPORT_OK;
                }


              int swt_gwsupport_GetType( void* pvApiCtx, int ivar)
              {
                SciErr sciErr;
                int *_piAddress;
                int type;

                sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
                if(sciErr.iErr)
                  {
                    printError(&sciErr, 0);
                    return 0;
                  }


                  sciErr = getVarType(pvApiCtx, _piAddress, &type);
                  if(sciErr.iErr)
                    {
                      printError(&sciErr, 0);
                      return 0;
                    }
                    return type;


              }

            int swt_gwsupport_GetMatrixdims( void* pvApiCtx, int ivar, int * _piRows , int * _piCols){

              SciErr sciErr;
              int *_piAddress;
              int type;

              sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
              if(sciErr.iErr)
                {
                  printError(&sciErr, 0);
                  return SWT_GWSUPPORT_ERROR;
                }
                sciErr = getVarDimension(pvApiCtx, _piAddress, _piRows, _piCols);
                if(sciErr.iErr)
                  {
                    printError(&sciErr, 0);
                    return SWT_GWSUPPORT_ERROR;
                  }

                  return SWT_GWSUPPORT_OK;


            }


            int swt_gwsupport_IsVarComplex( void* pvApiCtx, int ivar)
            {
              SciErr sciErr;
              int *_piAddress;

              sciErr = getVarAddressFromPosition(pvApiCtx, ivar, &_piAddress);
              if(sciErr.iErr)
                {
                  printError(&sciErr, 0);
                  return 0;
                }

                return isVarComplex(pvApiCtx, _piAddress);

                }
