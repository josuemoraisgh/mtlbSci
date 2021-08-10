/*
 * -------------------------------------------------------------------------
 * cwt_int.c -- continuous wavelet transform interface
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


#include "swt_common.h"
// #include "stack-c.h"
//
// converted to scilab-api



/*-------------------------------------------
 * Haar Scale Filter Generation
 *-----------------------------------------*/

/*int
int_haar 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5;
  static int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;

  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  haar_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  GetRhsVar (1, "d", &m1, &n1, &l1);
  GetRhsVar (2, "d", &m2, &n2, &l2);
  GetRhsVar (3, "i", &m3, &n3, &l3);

  haar_content_validate (pvApiCtx, &errCode, l3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = istk(l3)[0];
  m5 = 1;
  n5 = n4;

  CreateVar (4, "d", &m4, &n4, &l4);
  CreateVar (5, "d", &m5, &n5, &l5);
  linspace(stk(l1)[0], stk(l2)[0], istk(l3)[0], stk(l4), n4);
  haar(stk(l4), n4, stk(l5), n5, 1);

  AssignOutputVariable(pvApiCtx,1) = 5;
  AssignOutputVariable(pvApiCtx,2) = 4;
  return 0;
}*/

/*-------------------------------------------
 * Sinus Scale Filter Generation
 *-----------------------------------------*/

int
int_sinus 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;

  double *input1;
  double *input2;
  int *input3;
  int readFlag;

   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  sinus_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  sinus_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   CreateVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  linspace(input1[0], input2[0], input3[0], output1, n4);
  sinus(output1, n4, output2, n5, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}


/*-------------------------------------------
 * Poisson Scale Filter Generation
 *-----------------------------------------*/

int
int_poisson 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;

    double *input1;
  double *input2;
  int *input3;
  int readFlag;
   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  poisson_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  poisson_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  //   CreateVar (4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  linspace(input1[0], input2[0], input3[0], output1, n4);
  poisson(output1, n4, output2, n5, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Mexican Hat Scale Filter Generation
 *-----------------------------------------*/

int
int_mexihat 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;
   int readFlag;
    double *input1;
  double *input2;
  int *input3;
   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  mexihat_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  mexihat_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   CreateVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  linspace(input1[0], input2[0], input3[0], output1, n4);
  mexihat(output1, n4, output2, n5, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Morlet Scale Filter Generation
 *-----------------------------------------*/

int
int_morlet 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;
   int readFlag;

    double *input1;
  double *input2;
  int *input3;
   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  morlet_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  morlet_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   CreateVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  linspace(input1[0], input2[0], input3[0], output1, n4);
  morlet(output1, n4, output2, n5, 1);

//  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
//  AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * DoG Scale Filter Generation
 *-----------------------------------------*/

int
int_DOGauss 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;
   int readFlag;
    double *input1;
  double *input2;
  int *input3;
   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  DOGauss_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

 DOGauss_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   CreateVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  linspace(input1[0], input2[0], input3[0], output1, n4);
  DOGauss(output1, n4, output2, n5, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Gauss Scale Filter Generation
 *-----------------------------------------*/

int
int_Gauswavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5, m6, n6;
   int minlhs = 2, maxlhs = 2, minrhs = 4, maxrhs = 4;
   int readFlag;
  double *input1;
  double *input2;
  int *input3;
  int *input4;
   double *output1;
   double *output2;
  int errCode;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  Gauss_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
//   GetRhsVar (4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &input4);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

 Gauss_content_validate (pvApiCtx, &errCode, input1, input2, input3, input4);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m5 = 1;
  n5 = input3[0];
  m6 = 1;
  n6 = n5;

  //   CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m5 , n5 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  linspace(input1[0], input2[0], input3[0], output1, n5);
  Gauss(output1, n5, output2, n6, input4[0], 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}


/*-------------------------------------------
 * Shannon Scale Filter Generation
 *-----------------------------------------*/

int
int_shanwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5, m6, n6;
   int m7, n7;
   int minlhs = 1, maxlhs = 2, minrhs = 5, maxrhs = 5;
   int readFlag;
    double *input1;
  double *input2;
  int *input3;
   double *input4;
   double *input5;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  shanwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 4,  &m4, &n4, &input4);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 5,  &m5, &n5, &input5);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  shanwavf_content_validate (pvApiCtx, &errCode, input1, input2, input3, input4, input5);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m6 = 1;
  n6 = input3[0];
  m7 = 1;
  n7 = n6;
  it = 1;
//   CreateCVar (7, "d",&it, &m7, &n7, &l7r, &l7c);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1, m7, n7, &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2, m6, n6, &output1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  linspace(input1[0], input2[0], input3[0], output1, n6);
  shanwavf(output1, n6, input5[0], input4[0], output2_r, output2_i, n7,1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //if (Lhs>1)
  //  AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;

  return 0;
}

/*-------------------------------------------
 * Complex Morlet Scale Filter Generation
 *-----------------------------------------*/

int
int_cmorlet 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5, m6, n6;
   int  m7, n7;
   int readFlag;
   int minlhs = 2, maxlhs = 2, minrhs = 5, maxrhs = 5;

    double *input1;
  double *input2;
  int *input3;
   double *input4;
   double *input5;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  cmorlet_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 4,  &m4, &n4, &input4);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 5,  &m5, &n5, &input5);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  cmorlet_content_validate (pvApiCtx, &errCode, input1, input2, input3, input4, input5);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  m6 = 1;
  n6 = input3[0];
  m7 = 1;
  n7 = n6;
  it = 1;
//   CreateCVar (7, "d",&it, &m7, &n7, &l7r, &l7c);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m6 , n6 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }



  linspace(input1[0], input2[0], input3[0], output1, n6);
  cmorlet(output1, n6, input5[0], input4[0], output2_r, output2_i, n7, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Frequency B-Spline Scale Filter Generation
 *-----------------------------------------*/

int
int_fbspwavf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5, m6, n6;
   int l7, m7, n7, l8r, l8c, m8, n8;
   int minlhs = 2, maxlhs = 2, minrhs = 6, maxrhs = 6;
   int readFlag;

    double *input1;
  double *input2;
  int *input3;
   int *input4;
   double *input5;
     double *input6;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  fbspwavf_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (4, "i", &m4, &n4, &l4);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &input4);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 5,  &m5, &n5, &input5);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (6, "d", &m6, &n6, &l6);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 6,  &m6, &n6, &input6);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  fbspwavf_content_validate (pvApiCtx, &errCode,  input1, input2, input3, input4, input5, input6);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  m7 = 1;
  n7 = input3[0];
  m8 = 1;
  n8 = n7;
  it = 1;
//   CreateCVar (8, "d",&it, &m8, &n8, &l8r, &l8c);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1, m8, n8, &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar (7, "d", &m7, &n7, &l7);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m7 , n7 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }



  linspace(input1[0], input2[0], input3[0], output1, n7);
  fbspwavf(output1, n7, input4[0], input6[0], input5[0], output2_r, output2_i, n8, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}


/*-------------------------------------------
 * Complex Cauchy Scale Filter Generation
 *-----------------------------------------*/

int
int_cauchy 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, l5r, m5, n5;
  //static int l7r, l7c, m7, n7;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;
   int readFlag;
    double *input1;
  double *input2;
  int *input3;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  cauchy_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  //GetRhsVar (4, "d", &m4, &n4, &l4);
  //GetRhsVar (5, "d", &m5, &n5, &l5);

  cauchy_content_validate (pvApiCtx, &errCode, input1, input2, input3);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
  it = 1;
//   CreateCVar (5, "d",&it, &m5, &n5, &l5r, &l5i);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1, m5, n5, &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

//   CreateVar (4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }



  linspace(input1[0], input2[0], input3[0], output1, n4);
  cauchy_neo(output1, n4, output2_r, output2_i, n5, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Complex Gauss Scale Filter Generation
 *-----------------------------------------*/

int
int_cgauss 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, m5, n5, m6, n6;

   int minlhs = 2, maxlhs = 2, minrhs = 4, maxrhs = 4;
   int readFlag;
   double *input1;
   double *input2;
   int *input3;
   int *input4;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  Gauss_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (4, "i", &m4, &n4, &l4);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &input4);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  Gauss_content_validate (pvApiCtx, &errCode, input1, input2, input3, input4);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  m5 = 1;
  n5 = input3[0];
  m6 = 1;
  n6 = n5;
  it = 1;
//   CreateCVar (6, "d",&it, &m6, &n6, &&l6i);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m6, n6, &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

//   CreateVar (5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m5 , n5 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }


  linspace(input1[0], input2[0], input3[0], output1, n5);
  cgauss(output1, n5, input4[0], output2_r, output2_i, n6, 1);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

/*-------------------------------------------
 * Meyer Filter Generation
 *-----------------------------------------*/


int
int_meyer 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4, l5r, m5, n5, l5i;
  //static int l7r, l7c, m7, n7;
   int minlhs = 2, maxlhs = 2, minrhs = 3, maxrhs = 3;
   int readFlag;

    double *input1;
  double *input2;
  int *input3;
  int type;
   double *output1;
   double *output2_r, *output2_i;
  int errCode;
  int i,it;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  cauchy_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &input3);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  //GetRhsVar (4, "d", &m4, &n4, &l4);
  //GetRhsVar (5, "d", &m5, &n5, &l5);

//   cauchy_content_validate (pvApiCtx, &errCode, input1, input2, input3);
//   if (errCode != SUCCESS)
//     {
//       validate_print (errCode);
//       return 0;
//     }


  m4 = 1;
  n4 = input3[0];
  m5 = 1;
  n5 = n4;
  it = 1;
//   CreateCVar (5, "d",&it, &m5, &n5, &l5r, &l5i);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1, m5, n5, &output2_r, &output2_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


//   CreateVar (4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname,  2, m4, n4, &output1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  for (i=0;i<input3[0];i++)
    output1[i]=(-(double)input3[0]+2.*(double)i)/(2*((input2[0]-input1[0])/2/PI));


  //linspace(input1[0], input2[0], input3[0], output1, n4);
  meyer_phi(output1, n4, input1[0],input2[0], output2_r, output2_i, n5, 1);

  for (i=0;i<input3[0];i++)
    output1[i]=input1[0] + (double)i*((input2[0]-input1[0])/input3[0]);

  AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  return 0;
}

int
int_meyeraux 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2;
   int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
   int readFlag;
  double *input1;
  double *output1;
  int i;
//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  m2 = 1;
  n2 = 1;
  m2 = m1;
  n2 = n1;
//   CreateVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname,  1, m2, n2, &output1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  for (i=0;i<m1*n1;i++)
    meyeraux(input1[i],&output1[i]);
  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  return 0;
}

/*-------------------------------------------
 * Scale and Wavelet Function
 *-----------------------------------------*/

int
int_wavefun 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3, m4, n4;
   int m5, n5, m6, n6, m7, n7;
   int minlhs = 2, maxlhs = 5, minrhs = 2, maxrhs = 2;
   int readFlag;
  int ind, family, member, s1, s2, leng, count, level, it, l, errCode;
  double *lowfltr, *hifltr, *buff;
  double one, *phi, *psi;
  char a[2]="a",d[2]="d";
  Func syn_fun, ana_fun;
  swt_wavelet pWaveStruct;

   char * input_string = NULL;
  double *input1;
  int *input2;
  double *output1;
  double *output1_r, *output1_i;
  double *output2;
  double *output3;
  double *output4;
  double *output5;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wavefun_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "c", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string );
m1=1;n1=1;
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "i", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2 , &n2 , &input2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  wavefun_content_validate (pvApiCtx, &errCode, input_string, input2);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  level = (int)input2[0];
  if (level==0)
	  level = 8;
  wavelet_fun_parser (input_string, &ind);
  one = 1.0;

  if ((ind!=-1) && (wi[ind].rOrB==ORTH))
  {
	  if (Lhs!=3)
	  {
          Scierror(999,"Output arguments number should be 3!\n");
		  return 0;
	  }
      wavelet_parser(input_string,&family,&member);
	  syn_fun = wi[ind].synthesis;
      (*syn_fun)(member, &pWaveStruct);
	  upcoef_len_cal (1, pWaveStruct.length, level,
	       &s1, &s2);
	  swt_exp2(level, &leng);
      m3 = 1;
      n3 = leng*(pWaveStruct.length-1)+1;
	  m4 = 1;
	  n4 = n3;
	  m5 = 1;
	  n5 = n3;
// 	  CreateVar(3, "d", &m3, &n3, &l3);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
// 	  CreateVar(4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
// 	  CreateVar(5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
      phi=(double *) malloc(n3*sizeof(double));
      psi=(double *) malloc(n3*sizeof(double));

	  for(count=0;count<n3;count++)
	  {
		  phi[count] = 0;
		  psi[count] = 0;
	  }
	  l=1;
      upcoef (&one, 1, pWaveStruct.pLowPass,
		  pWaveStruct.pHiPass, pWaveStruct.length, phi+l,
	      s1, s1, a, level);
	  upcoef (&one, 1, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, psi+l,
	      s1, s1, d, level);
	  if ((family==COIFLETS) || (family==SYMLETS) || (family==DMEY))
	  {

		  for(count=0;count<n3;count++)
		  {
		      psi[count] = -1*psi[count];
		 }
	  }
	  for(count=0;count<n3;count++)
	  {
		  output1[count] = phi[count]*pow(sqrt(2),level);
		  output2[count] = psi[count]*pow(sqrt(2),level);
	  }
	  linspace(0.0, (double)(pWaveStruct.length-1), n3, output3, n3);
	  free(phi);
	  free(psi);
    // AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
	  // AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
	  // AssignOutputVariable(pvApiCtx,3) = nbInputArgument(pvApiCtx) + 3;
	    if (input_string != NULL)
    freeAllocatedSingleString(input_string);
	  filter_clear();
      return 0;
  }

  if ((ind!=-1) && (wi[ind].rOrB==BIORTH))
  {
	  if (Lhs!=5)
	  {
          Scierror(999,"Output arguments number should be 5!\n");
		  return 0;
	  }
      wavelet_parser(input_string,&family,&member);
	  ana_fun = wi[ind].analysis;
      (*ana_fun)(member, &pWaveStruct);
	  upcoef_len_cal (1, pWaveStruct.length, level,
	       &s1, &s2);
      swt_exp2(level, &leng);
      m3 = 1;
      n3 = leng*(pWaveStruct.length-1)+1;
	  m4 = 1;
	  n4 = n3;
	  m5 = 1;
	  n5 = n3;
	  m6 = 1;
	  n6 = n3;
	  m7 = 1;
	  n7 = n3;
// 	  CreateVar(3, "d", &m3, &n3, &l3);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

// 	  CreateVar(4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

// 	  CreateVar(5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
 }
// 	  CreateVar(6, "d", &m6, &n6, &l6);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m6 , n6 , &output4 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

// 	  CreateVar(7, "d", &m7, &n7, &l7);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 5,  m7 , n7 , &output5 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

	  for(count=0;count<n3;count++)
	  {
		  output1[count] = 0;
		  output2[count] = 0;
		  output3[count] = 0;
		  output4[count] = 0;
	  }
	  lowfltr = (double *)  malloc(pWaveStruct.length*sizeof(double));
	  hifltr =(double *)  malloc(pWaveStruct.length*sizeof(double));
      wrev(pWaveStruct.pLowPass, pWaveStruct.length, lowfltr, pWaveStruct.length);
	  qmf_wrev(lowfltr,pWaveStruct.length,hifltr,pWaveStruct.length);
	  l=1;
        upcoef (&one, 1, lowfltr, hifltr, pWaveStruct.length, output1+l,
	      s1, s1, a, level);
        upcoef (&one, 1, lowfltr, hifltr, pWaveStruct.length, output2+l,
	      s1, s1, d, level);
	  free(lowfltr);
	  free(hifltr);
	  filter_clear();
      syn_fun = wi[ind].synthesis;
      (*syn_fun)(member, &pWaveStruct);
       upcoef (&one, 1, pWaveStruct.pLowPass,
		  pWaveStruct.pHiPass, pWaveStruct.length, output3+l,
	      s1, s1, a, level);
	   upcoef (&one, 1, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, output4+l,
	      s1, s1, d, level);
	   for(count=0;count<n3;count++)
	     {
			  output1[count] = output1[count]*pow(sqrt(2),level);
		      output2[count] = -1*output2[count]*pow(sqrt(2),level);
			  output3[count] = output3[count]*pow(sqrt(2),level);
		     output4[count] = -1*output4[count]*pow(sqrt(2),level);
		 }
	  linspace(0.0, (double)(pWaveStruct.length-1), n3, output5, n3);
	  // AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
	  // AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
	  // AssignOutputVariable(pvApiCtx,3) = nbInputArgument(pvApiCtx) + 3;
	  // AssignOutputVariable(pvApiCtx,4) = nbInputArgument(pvApiCtx) + 4;
	  // AssignOutputVariable(pvApiCtx,5) = nbInputArgument(pvApiCtx) + 5;
	    if (input_string != NULL)
    freeAllocatedSingleString(input_string);
	  filter_clear();
	  return 0;
  }

  cwt_fun_parser(input_string, &ind);
  if ((ind!=-1) && (ci[ind].phipsi==PSI_ONLY) && (ci[ind].realOrComplex==REAL) )
  {
	  if (Lhs!=2)
	  {
          Scierror(999,"Output arguments number should be 2!\n");
		  return 0;
	  }
	  swt_exp2(level, &leng);
      m3 = 1;
      n3 = leng;
	  m4 = 1;
	  n4 = n3;
// 	  CreateVar(3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

// 	  CreateVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

	  linspace(ci[ind].lb, ci[ind].ub, n3, output2, n3);
	  (*(ci[ind].scalef))(output2,n3,output1,n3,ci[ind].cpsi);
	  // AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
	  // AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
	    if (input_string != NULL)
    freeAllocatedSingleString(input_string);
	  return 0;
  }

  if ((ind!=-1) && (ci[ind].phipsi==PSI_ONLY) && (ci[ind].realOrComplex==COMPLEX) )
  {
	  if (Lhs!=2)
	  {
          Scierror(999,"Output arguments number should be 2!\n");
		  return 0;
	  }
	  swt_exp2(level, &leng);
      m3 = 1;
      n3 = leng;
	  m4 = 1;
	  n4 = n3;
	  it = 1;
//       CreateCVar(3, "d", &it, &m3, &n3, &l3r, &l3i);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1_r,&output1_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

// 	  CreateVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

	  buff = (double *) malloc(n3*2*sizeof(double));
	  linspace(ci[ind].lb, ci[ind].ub, n3, output2, n3);
	  (*(ci[ind].scalef))(output2,n3,buff,n3,ci[ind].cpsi);
	  for(count=0;count<n3;count++)
	  {
        output1_r[count]=buff[count];
		output1_i[count]=buff[count+n3];
	  }
	  free(buff);
	  // AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
	  // AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
	    if (input_string != NULL)
    freeAllocatedSingleString(input_string);
	  return 0;
  }
     return 0;
}

/*-------------------------------------------
 * 2D Scale and Wavelet Function
 *-----------------------------------------*/

int
int_wavefun2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3, m4, n4;
   int m5, n5, m6, n6, m7, n7;
   int minlhs = 5, maxlhs = 5, minrhs = 2, maxrhs = 2;
   int readFlag;
   char * input_string = NULL;
   int *input2;
  int type;
  double *output1;
  double *output2;
  double *output3;
  double *output4;
  double *output5;

  int ind, family, member, s1, s2, leng, count, level, row, col, l, errCode;
  double one, *phi, *psi, *xval;
  char a[2]="a",d[2]="d";
  Func syn_fun;
  swt_wavelet pWaveStruct;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wavefun2_form_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

//   GetRhsVar (1, "c", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,1 , &input_string );
m1=1;n1=1;
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "i", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2 , &n2 , &input2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  wavefun2_content_validate (pvApiCtx, &errCode, input_string, input2);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  level = input2[0];
  if (level==0)
	  level = 4;

  wavelet_fun_parser (input_string, &ind);
  one = 1.0;

 if ((ind!=-1) && (wi[ind].rOrB==ORTH))
  {
      wavelet_parser(input_string,&family,&member);
	  syn_fun = wi[ind].synthesis;
      (*syn_fun)(member, &pWaveStruct);
	  upcoef_len_cal (1, pWaveStruct.length, level,
	       &s1, &s2);

	  swt_exp2(level, &leng);
      m3 = leng*(pWaveStruct.length-1)+1;
      n3 = leng*(pWaveStruct.length-1)+1;
	  m4 = m3;
	  n4 = n3;
	  m5 = m3;
	  n5 = n3;
	  m6 = m3;
	  n6 = n3;
	  m7 = m3;
	  n7 = n3;
// 	  CreateVar(3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
// 	  CreateVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
// 	  CreateVar(5, "d", &m5, &n5, &l5);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

// 	  CreateVar(6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m6 , n6 , &output4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
// 	  CreateVar(7, "d", &m7, &n7, &l7);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 5,  m7 , n7 , &output5 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


	  phi=(double *) malloc(n3*sizeof(double));
	  psi=(double *) malloc(n3*sizeof(double));
      xval=(double *) malloc(n3*sizeof(double));
	  for(count=0;count<n3;count++)
	  {
		  phi[count] = 0;
		  psi[count] = 0;

	  }
	  l=(int)(floor((n3-s1)/2));
      upcoef (&one, 1, pWaveStruct.pLowPass,
		  pWaveStruct.pHiPass, pWaveStruct.length, phi+l,
	      s1, s1, a, level);
	  upcoef (&one, 1, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, psi+l,
	      s1, s1, d, level);
	  linspace(0.0, (double)(pWaveStruct.length), n3, xval, n3);
	  if ((family==COIFLETS) || (family==SYMLETS) || (family==DMEY))
	  {

		  for(count=0;count<n3;count++)
	     {
		      psi[count] = -1*(psi[count]);
		 }
	  }
	  for (col=0;col<n3;col++)
	  {
		  for(row=0;row<n3;row++)
		  {
			  output1[row+col*n3]=phi[col]*phi[row]*pow(sqrt(2),level*2);
			  output2[row+col*n3]=psi[col]*phi[row]*pow(sqrt(2),level*2);
              output3[row+col*n3]=phi[col]*psi[row]*pow(sqrt(2),level*2);
			  output4[row+col*n3]=psi[col]*psi[row]*pow(sqrt(2),level*2);
			  output5[row+col*n3]=xval[col]*xval[row];
		  }
	  }
	  free(phi);
	  free(psi);
	  free(xval);
	  // AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
	  // AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
	  // AssignOutputVariable(pvApiCtx,3) = nbInputArgument(pvApiCtx) + 3;
	  // AssignOutputVariable(pvApiCtx,4) = nbInputArgument(pvApiCtx) + 4;
	  // AssignOutputVariable(pvApiCtx,5) = nbInputArgument(pvApiCtx) + 5;
	  if (input_string != NULL)
    freeAllocatedSingleString(input_string);
	  filter_clear();
      return 0;
  }
  if ((ind!=-1) && (wi[ind].rOrB==BIORTH))
  {

          Scierror(999,"wavefun2 does not work with BIORTH splines!\n");
		  return 0;
  }
  cwt_fun_parser(input_string, &ind);
  if ((ind!=-1) && (ci[ind].phipsi==PSI_ONLY) && (ci[ind].realOrComplex==REAL) )
  {
    Scierror(999,"wavefun2 does not work with REAL splines!\n");
		  return 0;
  }

  if ((ind!=-1) && (ci[ind].phipsi==PSI_ONLY) && (ci[ind].realOrComplex==COMPLEX) )
  {
    Scierror(999,"wavefun2 does not work with COMPLEX splines!\n");
		  return 0;
  }
   return 0;
}

/*-------------------------------------------
 * CWT Utility
 *-----------------------------------------*/
/*int
int_wpsi 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
    static int m1, n1, m2, n2, l2r, l2i;
	static int minlhs=1, maxlhs = 1, minrhs = 1, maxrhs = 1;
	int ind1, ind2, it, count, family, member;
	double *fbuf;
	Func syn_fun;
    swt_wavelet pWaveStruct;

    CheckInputArgument(pvApiCtx,minrhs, maxrhs);
    CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

    GetRhsVar (1, "c", &m1, &n1, &l1);

	m2 = 1;
	it = 1;

	wavelet_fun_parser (cstk(l1), &ind1);
	cwt_fun_parser(cstk(l1), &ind2);

    if (ind1!=-1)
	{
       wavelet_parser(cstk(l1),&family,&member);
	   syn_fun = wi[ind1].synthesis;
       (*syn_fun)(member, &pWaveStruct);
	   n2=1024*(pWaveStruct.length-1)+1;
	   filter_clear();
	   CreateVar(2, "d", &m2, &n2, &l2);
	   full_range_scalef (cstk(l1), stk(l2), n2);
	}
	else if ((ind2!=-1) && (ci[ind2].realOrComplex==REAL))
	{
	   n2 = 1024;
       CreateVar(2, "d", &m2, &n2, &l2);
	   full_range_scalef (cstk(l1), stk(l2), n2);
	}
	else if ((ind2!=-1) && (ci[ind2].realOrComplex==COMPLEX))
	{
		n2 = 1024;
        CreateCVar(2, "d", &it, &m2, &n2, &l2r, &l2i);
        fbuf=malloc(n2*2*sizeof(double));
		full_range_scalef (cstk(l1), fbuf, 2*n2);
		for(count=0;count<n2;count++)
		{
			stk(l2r)[count]=fbuf[count];
			stk(l2i)[count]=fbuf[count+n2];
		}
		free(fbuf);
	}
	else
		return 0;

    AssignOutputVariable(pvApiCtx,1) = 2;
	return 0;
}

int
int_cwtscale 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
	static int m1, n1, m2, n2, m3, n3;
	static int minlhs=1, maxlhs=1, minrhs=2, maxrhs=2;
    double delta;

	GetRhsVar (1, "d", &m1, &n1, &l1);
    GetRhsVar (2, "i", &m2, &n2, &l2);

	m3 = 1;
	cwt_len_cal (m1*n1, istk(l2)[0], &n3, &delta);
	CreateVar(3, "d", &m3, &n3, &l3);
    scale_real (stk(l1), m1*n1, delta, stk(l3), n3);
    AssignOutputVariable(pvApiCtx,1) = 3;
	return 0;
}

int
int_cwtconv 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
    static int m1, n1, m2, n2, l2r, l2i, m3, n3, l3r, l3i;
	static int minlhs=1, maxlhs=1, minrhs=2, maxrhs=2;
	int it;

    CheckInputArgument(pvApiCtx,minrhs, maxrhs);
    CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

    GetRhsVar (1, "d", &m1, &n1, &l1);
    GetRhsCVar (2, "d", &it, &m2, &n2, &l2r, &l2i);

	m3 = 1;
	n3 = m1*n1;
	if (it!=1)
	{
        CreateVar(3, "d", &m3, &n3, &l3);
		cwt_conv_real (stk(l1), m1*n1, stk(l2), m2*n2, stk(l3), n3);
	}
	else
	{
		CreateCVar(3, "d", &it, &m3, &n3, &l3r, &l3i);
		cwt_conv_complex (stk(l1), m1*n1, stk(l2r), stk(l2i), m2*n2,
					   stk(l3r), stk(l3i), m3*n3);
	}

	AssignOutputVariable(pvApiCtx,1) = 3;
	return 0;
}*/

/*-------------------------------------------
 * Continuous Wavelet Transform
 *-----------------------------------------*/

int
int_cwt 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int m1, n1, m2, n2, m3, n3;
   int m4, n4;
   int minlhs = 1, maxlhs = 1, minrhs = 3, maxrhs = 3;
   int readFlag;
   char * input_string = NULL;
    double *input1,*input1_r,*input1_i;
  double *input2;
   double *output1, *output1_r, *output1_i;
  int ind1, ind2, count, len, plen, family, member, i, it, scale, errCode, flow;
  double delta;
  double *psi, *f, *temp, *tempi;
  Func syn_fun;
  swt_wavelet pWaveStruct;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  cwt_form_validate (pvApiCtx, &errCode, &flow);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }
 if (flow==1)
 {
//   GetRhsVar (1, "d", &m1, &n1, &l1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar (3, "c", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string );
m3=1;n3=1;
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  cwt_content_validate (pvApiCtx, &errCode, input_string);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = m2*n2;
  n4 = m1*n1;
  it = 1;

  wavelet_fun_parser (input_string, &ind1);
  cwt_fun_parser(input_string, &ind2);

  if (ind1!=-1)
  {

	  wavelet_parser(input_string,&family,&member);
	  syn_fun = wi[ind1].synthesis;
      (*syn_fun)(member, &pWaveStruct);
	  plen=1024*(pWaveStruct.length-1)+1;
	  filter_clear();
	  psi=(double *) malloc(plen*sizeof(double));
	  full_range_scalef (input_string, psi, plen);
	  //ocumsum(psi,plen);
    // 	  CreateVar(4, "d", &m4, &n4, &l4);
    readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  //tim = (int)(floor(len/n4));
	  //scale = (int)(floor(stk(l2)[0]));
	  for (count=0;count<m4;count++)
	  {
		  scale = (int)(floor(input2[count]));
		  if (scale<1)
			  scale = 1;
		  cwt_len_cal (plen, (scale*pWaveStruct.length+1), &len, &delta);
		  f = (double *) malloc(len*sizeof(double));
		  scale_real (psi, plen, delta, f, len);

		  for(i=0;i<len;i++)
			f[i]=f[i]/sqrt(scale);
		  cwt_conv_real (input1, n4, f, len, temp+count*n4, n4);
		  free(f);
	  }

	  free(psi);
	  matrix_tran(temp,m4,n4,output1,n4,m4);
	  free(temp);
  }

  if ((ind2!=-1) && (ci[ind2].realOrComplex==REAL))
  {


// 	  CreateVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  //scale = (int)(floor(stk(l2)[count]));
		  plen=(int)((ci[ind2].ub-ci[ind2].lb)*(input2[count]))+1;
		  if (plen<3)
			  plen = 3;
	      psi=(double *) malloc(plen*sizeof(double));
	      full_range_scalef (input_string, psi, plen);
          for(i=0;i<plen;i++)
			psi[i]=psi[i]/sqrt(input2[count]);
		  cwt_conv_real (input1, n4, psi, plen, temp+count*n4, n4);
		  free(psi);
	  }
	  matrix_tran(temp,m4,n4,output1,n4,m4);
	  free(temp);
  }

  if ((ind2!=-1) && (ci[ind2].realOrComplex==COMPLEX))
  {


// 	  CreateCVar(4, "d", &it, &m4, &n4, &l4r, &l4i);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1_r,&output1_i  );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  tempi = (double *) malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  plen=((int)((ci[ind2].ub-ci[ind2].lb)*(input2[count])+1))*2;//(int)((ci[ind2].ub-ci[ind2].lb)*(stk(l2)[count]+1))*2;
		  if (plen<3)
			  plen = 3;
	      psi=(double *) malloc(plen*sizeof(double));
	      full_range_scalef (input_string, psi, plen);
          for(i=0;i<plen;i++)
			psi[i]=psi[i]/sqrt(input2[count]);
		  cwt_conv_complex (input1, n4, psi, psi+plen/2, plen/2, temp+count*n4, tempi+count*n4, n4);
		  free(psi);
	  }
	  matrix_tran(temp,m4,n4,output1_r,n4,m4);
	  matrix_tran(tempi,m4,n4,output1_i,n4,m4);
	  free(temp);
	  free(tempi);
  }
  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  if (input_string != NULL)
    freeAllocatedSingleString(input_string);
  return 0;
 }

 if (flow==2)
 {
// 	  GetRhsCVar (1, "d", &it, &m1, &n1, &l1r, &l1i);
    readFlag = swt_gwsupport_GetComplexMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1,&input1_r, &input1_i);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//       GetRhsVar (2, "d", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//       GetRhsVar (3, "c", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

	   cwt_content_validate (pvApiCtx, &errCode, input_string);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  m4 = m2*n2;
  n4 = m1*n1;
  it = 1;

  wavelet_fun_parser (input_string, &ind1);
  cwt_fun_parser(input_string, &ind2);

  if (ind1!=-1)
  {

	  wavelet_parser(input_string,&family,&member);
	  syn_fun = wi[ind1].synthesis;
      (*syn_fun)(member, &pWaveStruct);
	  plen=1024*(pWaveStruct.length-1)+1;
	  filter_clear();
	  psi=(double *) malloc(plen*sizeof(double));
	  full_range_scalef (input_string, psi, plen);

// 	  CreateCVar(4, "d", &it, &m4, &n4, &l4r, &l4i);
readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1_r,&output1_i  );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  tempi = (double *) malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  scale = (int)(floor(input2[count]));
		  if (scale<1)
			  scale = 1;
		  cwt_len_cal (plen, (scale*pWaveStruct.length+1), &len, &delta);
		  f = (double *) malloc(len*sizeof(double));
		  scale_real (psi, plen, delta, f, len);

		  for(i=0;i<len;i++)
			f[i]=f[i]/sqrt(scale);
		  cwt_conv_real (input1_r, n4, f, len, temp+count*n4, n4);
		  cwt_conv_real (input1_i, n4, f, len, tempi+count*n4, n4);
	  }
	  free(f);
	  free(psi);
	  matrix_tran(temp,m4,n4,output1_r,n4,m4);
      matrix_tran(tempi,m4,n4,output1_i,n4,m4);
	  free(temp);
	  free(tempi);
  }

  if ((ind2!=-1) && (ci[ind2].realOrComplex==REAL))
  {


// 	  CreateCVar(4, "d", &it, &m4, &n4, &l4r, &l4i);
    readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1_r,&output1_i  );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  tempi = (double *) malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  //scale = (int)(floor(stk(l2)[count]));
		  plen=(int)((ci[ind2].ub-ci[ind2].lb)*(input2[count]))+1;
		  if (plen<3)
			  plen = 3;
	      psi=(double *) malloc(plen*sizeof(double));
	      full_range_scalef (input_string, psi, plen);
          for(i=0;i<plen;i++)
		  psi[i]=psi[i]/sqrt(input2[count]);
		  cwt_conv_real (input1_r, n4, psi, plen, temp+count*n4, n4);
		  cwt_conv_real (input1_i, n4, psi, plen, tempi+count*n4, n4);
		  free(psi);
	  }
	  matrix_tran(temp,m4,n4,output1_r,n4,m4);
	  matrix_tran(tempi,m4,n4,output1_i,n4,m4);
	  free(temp);
	  free(tempi);
  }

  if ((ind2!=-1) && (ci[ind2].realOrComplex==COMPLEX))
  {


// 	  CreateCVar(4, "d", &it, &m4, &n4, &l4r, &l4i);
    readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1_r,&output1_i  );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
	  temp = (double *) malloc(m4*n4*sizeof(double));
	  tempi = (double *) malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  plen=((int)((ci[ind2].ub-ci[ind2].lb)*(input2[count])+1))*2;//(int)((ci[ind2].ub-ci[ind2].lb)*(stk(l2)[count]+1))*2;
		  if (plen<3)
			  plen = 3;
	      psi=(double *) malloc(plen*sizeof(double));
	      full_range_scalef (input_string, psi, plen);
          for(i=0;i<plen;i++)
			psi[i]=psi[i]/sqrt(input2[count]);
		  cwt_conv_complex_complex (input1_r, input1_i, n4, psi, psi+plen/2, plen/2, temp+count*n4, tempi+count*n4, n4);
		  free(psi);
	  }
	  matrix_tran(temp,m4,n4,output1_r,n4,m4);
	  matrix_tran(tempi,m4,n4,output1_i,n4,m4);
	  free(temp);
	  free(tempi);
  }

      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
      if (input_string != NULL)
	freeAllocatedSingleString(input_string);
      return 0;
 }
}

/*-------------------------------------------
 * Continuous Wavelet Transform Type II
 *-----------------------------------------*/

/*int
int_cwtzwei 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, lrx, lcx;
  static int minlhs = 1, maxlhs = 1, minrhs = 3, maxrhs = 3;
  int ind2, count, len, plen, i;
  double *psi, *temp;


  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  GetRhsVar (1, "d", &m1, &n1, &l1);
  GetRhsVar (2, "i", &m2, &n2, &l2);
  GetRhsVar (3, "c", &m3, &n3, &l3);


  m4 = m2*n2;
  n4 = m1*n1;


  cwt_fun_parser(cstk(l3), &ind2);

  if ((ind2!=-1) && (ci[ind2].realOrComplex==REAL))
  {


	  CreateVar(4, "d", &m4, &n4, &l4);
	  temp = malloc(m4*n4*sizeof(double));
	  for (count=0;count<m4;count++)
	  {
		  plen=(ci[ind2].ub-ci[ind2].lb)*istk(l2)[count]+1;
	      psi=malloc(plen*sizeof(double));
	      full_range_scalef (cstk(l3), psi, plen);
          for(i=0;i<plen;i++)
			psi[i]=psi[i]/sqrt(istk(l2)[count]);
		  cwt_conv_real (stk(l1), n4, psi, plen, temp+count*n4, n4);
		  free(psi);
	  }
	  matrix_tran(temp,m4,n4,stk(l4),n4,m4);
	  free(temp);
  }

  AssignOutputVariable(pvApiCtx,1) = 4;

  return 0;
}*/
