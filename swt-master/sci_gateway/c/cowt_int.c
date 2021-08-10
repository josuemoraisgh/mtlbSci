/*
 * -------------------------------------------------------------------------
 * cowt_int.c -- dual tree complex wavelet transform interface
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


int
int_FSfarras
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs=1, maxlhs=2, minrhs=1, maxrhs=1;
  swt_wavelet pWaveStruct;
  Func ana_fun,syn_fun;
  int family, member, ii, errCode;
  char s1[]={"fa1"};
  char s2[]={"fa2"};
  double *var1,*var2;
  int readFlag;
  char * input_string1 = NULL;
  //SciErr _SciErr;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

//   GetRhsVar(1, "c", &m1, &n1, &l1);

  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  var1 = (double *)malloc(40*sizeof(double));
  var2 = (double *)malloc(40*sizeof(double));

  wavelet_parser(s1,&family,&member);
  wavelet_fun_parser (s1, &ii);
  ana_fun = wi[ii].analysis;
  (*ana_fun)(member, &pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var1, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var1+pWaveStruct.length, pWaveStruct.length);

  syn_fun = wi[ii].synthesis;
  (*syn_fun)(member,&pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var2, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var2+pWaveStruct.length, pWaveStruct.length);

  wavelet_parser(s2,&family,&member);
  wavelet_fun_parser (s2, &ii);
  ana_fun = wi[ii].analysis;
  (*ana_fun)(member, &pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var1+20, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var1+30, pWaveStruct.length);

  syn_fun = wi[ii].synthesis;
  (*syn_fun)(member,&pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var2+20, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var2+30, pWaveStruct.length);

  //if ((cstk(l1)[0] == 'f') || (cstk(l1)[0] == 'F'))
  if ((input_string1[0] == 'f') || (input_string1[0] == 'F'))
    {
      double *output1,*output2;
      m2 = 4;
      n2 = 10;
      m3 = 4;
      n3 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
//       CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output2 );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }

      matrix_tran(var1,m2,n2,output1,n2,m2);
      matrix_tran(var2,m3,n3,output2,n3,m3);
      //AssignOutputVariable(pvApiCtx,1) = Rhs+1;
      //AssignOutputVariable(pvApiCtx,2) = Rhs+2;
    }
//   else if ((cstk(l1)[0] == 'a') || (cstk(l1)[0] == 'A'))
  else if ((input_string1[0] == 'a') || (input_string1[0] == 'A'))
    {
      double *output1;
      m2 = 4;
      n2 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
//     matrix_tran(var1,m2,n2,stk(l2),n2,m2);
      matrix_tran(var1,m2,n2,output1,n2,m2);
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
    }
//   else if ((cstk(l1)[0] == 's') || (cstk(l1)[0] == 'S'))
  else if ((input_string1[0] == 's') || (input_string1[0] == 'S'))
    {
      double *output1;
      m2 = 4;
      n2 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
//       matrix_tran(var2,m2,n2,stk(l2),n2,m2);
      matrix_tran(var2,m2,n2,output1,n2,m2);
//      AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
    }
  else
    {
      errCode = UNKNOWN_INPUT_ERR;
      validate_print (errCode);
    }
  if (input_string1 != NULL)
    freeAllocatedSingleString(input_string1);
  free(var1);
  free(var2);
  return 0;
}


int
int_dualfilt1
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs=1, maxlhs=2, minrhs=1, maxrhs=1;
  swt_wavelet pWaveStruct;
  Func ana_fun,syn_fun;
  int family, member, ii, errCode;
  char s1[]={"ksq1"};
  char s2[]={"ksq2"};
  double *var1,*var2;
  char * input_string = NULL;
  double *output1;
  double *output2;
  int readFlag;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

//   GetRhsVar(1, "c", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string );
    m1=1;n1=1;
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }

  var1 = (double *)malloc(40*sizeof(double));
  var2 = (double *)malloc(40*sizeof(double));

  wavelet_parser(s1,&family,&member);
  wavelet_fun_parser (s1, &ii);
  ana_fun = wi[ii].analysis;
  (*ana_fun)(member, &pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var1, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var1+pWaveStruct.length, pWaveStruct.length);

  syn_fun = wi[ii].synthesis;
  (*syn_fun)(member,&pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var2, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var2+pWaveStruct.length, pWaveStruct.length);

  wavelet_parser(s2,&family,&member);
  wavelet_fun_parser (s2, &ii);
  ana_fun = wi[ii].analysis;
  (*ana_fun)(member, &pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var1+20, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var1+30, pWaveStruct.length);

  syn_fun = wi[ii].synthesis;
  (*syn_fun)(member,&pWaveStruct);

  verbatim_copy(pWaveStruct.pLowPass, pWaveStruct.length, var2+20, pWaveStruct.length);
  verbatim_copy(pWaveStruct.pHiPass, pWaveStruct.length, var2+30, pWaveStruct.length);

//   if (cstk(l1)[0] == 'f')
  if (input_string[0] == 'f')
    {
      double *ptr,*ptr2;
      m2 = 4;
      n2 = 10;
      m3 = 4;
      n3 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
//       CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &ptr );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

       readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m3 , n3 , &ptr2 );
       if(readFlag==SWT_GWSUPPORT_ERROR)
         {
           return 0;
         }

      matrix_tran(var1,m2,n2,ptr,n2,m2);
      matrix_tran(var2,m3,n3,ptr2,n3,m3);
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) +1;
      //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) +2;
    }
//   else if (cstk(l1)[0] == 'a')
  else if (input_string[0] == 'a')
    {
      double *ptr;
      m2 = 4;
      n2 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
             readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &ptr );
             if(readFlag==SWT_GWSUPPORT_ERROR)
               {
                 return 0;
               }
      matrix_tran(var1,m2,n2,ptr,n2,m2);
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
    }
//   else if (cstk(l1)[0] == 's')
  else if (input_string[0] == 's')
    {
       double *ptr;
      m2 = 4;
      n2 = 10;
//       CreateVar(2, "d", &m2, &n2, &l2);
    readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &ptr );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      matrix_tran(var2,m2,n2,ptr,n2,m2);
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
    }
  else
    {
      errCode = UNKNOWN_INPUT_ERR;
      validate_print (errCode);
    }

  if (input_string != NULL)
    freeAllocatedSingleString(input_string);
  free(var1);
  free(var2);
  return 0;
}

int
int_dualtree
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l6, m6, n6, l7, m7, n7, l8, m8, n8;
   int l5r, l5c;
  static int minlhs=2, maxlhs=2, minrhs=4, maxrhs=6;
  int errCode, flow, calLen, temLen, count, ln, it, stride, val;
  double *f1, *f2;
  int readFlag;
  double *input1;
  int *input2;
  double *input3;
  double *input4;


  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  dualtree_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

//   GetRhsVar(1, "d", &m1, &n1, &l1);
// GetRhsVarDouble(1,  &m1, &n1, input1);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar(2, "i", &m2, &n2, &l2);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(3, "d", &m3, &n3, &l3);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(4, "d", &m4, &n4, &l4);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }

  wave_len_validate ( m1*n1, n3, &stride, &val);
  if ((!val) || (stride<input2[0]))
    {
      sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }

  if (getdwtMode()==PER)
    {
      ln = 0;
      calLen = n1 * m1;
      for (count = 0; count < input2[0]; count++)
	{
	  calLen = (int)ceil(((double)(calLen))/2.0);
	  temLen = calLen;
	  ln += temLen;
	}
      ln += temLen;
    }
  else
    {
      ln = 0;
      calLen = n1 * m1;
      for (count = 0; count < input2[0]; count++)
	{
	  calLen += n3 - 1;
	  temLen = calLen/2;
	  ln += temLen;
	  calLen = temLen;
	}
      ln += temLen;
    }

  f1 = (double *)malloc(m3*n3*sizeof(double));
  f2 = (double *)malloc(m3*n3*sizeof(double));
  matrix_tran(input3,n3,m3,f1,m3,n3);
  matrix_tran(input4,n3,m3,f2,m3,n3);

  switch (flow) {
  case 1:
    {
      double *ptr_r,*ptr_i,*ptr2;
      int *ptr2_int;
      int i,j;
      //sciprint("flow 1\n");
      m5 = 1;
      n5 = ln;
      m6 = 1;
      n6 = input2[0] + 2;
      it = 1;
//       CreateCVar (5, "d",&it, &m5, &n5, &l5r, &l5c);

  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &ptr_r,&ptr_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//       CreateVar(6, "i", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &ptr2_int );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

//	ptr2_int = (int*)malloc(sizeof(int) * m6 * n6);
      wave_dec_len_cal (n3, m1*n1, input2[0], ptr2_int);
      cowavedec (input1, m1*n1, ptr_r, ptr_i, n5,
		 f1, f1+n3, f1+n3*2, f1+n3*3,
		 f2, f2+n3, f2+n3*2, f2+n3*3,
		 n3, ptr2_int, n6, input2[0], getdwtMode());

    //  for(i = 0 ; i < m6 ; i++)
    //    for(j = 0 ; j < n6 ; j++)
    //                ptr2[i + m6 * j] = (double)ptr2_int[i + m6 * j];


    //free(ptr2_int);
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
      //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
      break;
    }
  default:
    sciprint("input not valid\n");
    break;
  }

  free(f1);
  free(f2);

  return 0;
}

int
int_idualtree
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l1r, l1c;
   int minlhs=1, maxlhs=1, minrhs=4, maxrhs=4;
  int errCode, flow, it, val, count, len;
  double *f1, *f2;
   int readFlag;
  double *input1_r,*input1_i;
  int *input2;
  double *input3;
  double *input4;
  //SciErr _SciErr;
   double *output1;
   int i,j;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  idualtree_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

//   GetRhsCVar(1, "d", &it, &m1, &n1, &l1r, &l1c);
    readFlag = swt_gwsupport_GetComplexMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1, &input1_r,&input1_i );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(2, "i", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar(3, "d", &m3, &n3, &l3);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(4, "d", &m4, &n4, &l4);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }

  len = 0;
  for (count = 0; count < (m2 * n2 - 1); count++)
    len += input2[count];
  if (len != m1 * n1)
    {
      sciprint ("Inputs are not coef and length array!\n");
      return 0;
    }
  val = 0;
  for (count = 0; count < (m2 * n2 - 1); count++)
    {
      if (input2[count] > input2[count + 1])
	{
	  val = 1;
	  break;
	}
    }
  if (val != 0)
    {
      sciprint ("Inputs are not coef and length array!\n");
      return 0;
    }

  if (input2[0] < n3)
    {
      sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }

  m5 = 1;
  n5 = input2[m2*n2-1];
//   CreateVar(5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  f1 = (double *)malloc(m3*n3*sizeof(double));
  f2 = (double *)malloc(m3*n3*sizeof(double));
  matrix_tran(input3,n3,m3,f1,m3,n3);
  matrix_tran(input4,n3,m3,f2,m3,n3);
  //input2_int = (int*)malloc(sizeof(int) * m2 * n2);
  //      for(i = 0 ; i < m2 ; i++)
  //      for(j = 0 ; j < n2 ; j++)
  //                  input2_int[i + m2 * j] = (int)input2[i + m2 * j];

  cowaverec (input1_r, input1_i, m1*n1, output1, m5*n5,
	     f1, f1+n3, f1+n3*2, f1+n3*3,
	     f2, f2+n3, f2+n3*2, f2+n3*3,
	     n3, input2, m2*n2, m2*n2-2, getdwtMode());

  //free(input2_int);
  free(f1);
  free(f2);
  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;

  return 0;
}


int
int_dualtree2D
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l6, m6, n6, l7, m7, n7, l8, m8, n8;
   int l5r, l5c;
   int minlhs=2, maxlhs=2, minrhs=4, maxrhs=4;
  int errCode, flow, calLen, temLen, count, ln, it, stride, val;
  int val1, val2, stride1, stride2, row, col, total, *pLen;
  double *f1, *f2, *mr, *mi;
  double *input1;
  int *input2;
  double *input3;
  double *input4;
  //SciErr _SciErr;
      double *output1_r,*output1_i;
      int *output2;
      int readFlag;


  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  dualtree2D_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

//   GetRhsVar(1, "d", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(2, "i", &m2, &n2, &l2);
    readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(3, "d", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar(4, "d", &m4, &n4, &l4);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }

  wave_len_validate ( m1, n3, &stride1, &val1);
  wave_len_validate ( n1, n3, &stride2, &val2);
  if ((val1 == 0) || (val2 == 0))
    {
      sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }
  stride = (stride1 > stride2) ? stride2 : stride1;
  if ((input2[0] < 1) || (input2[0] > stride))
    {
      sciprint ("Level Parameter is not valid for input matrix!\n");
      return 0;
    }
  pLen = (int *)malloc ((input2[0] + 2) * 2 * sizeof (int));
  matrix_wavedec_len_cal (m1, n1, (int)input2[0], n3, pLen);
  wave_mem_cal (pLen, (int)input2[0], &total);

  f1 = (double *)malloc(m3*n3*sizeof(double));
  f2 = (double *)malloc(m3*n3*sizeof(double));

  matrix_tran(input3,n3,m3,f1,m3,n3);
  matrix_tran(input4,n3,m3,f2,m3,n3);

  it = 1;
  m5 = 1;
  n5 = total;
  m6 = input2[0] + 2;
  n6 = 2;
//   CreateCVar (5, "d",&it, &m5, &n5, &l5r, &l5c);
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1, m5, n5, &output1_r,&output1_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar(6, "i", &m6, &n6, &l6);
readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &output2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }



  mr = (double *)malloc(m5*n5*sizeof(double));
  mi = (double *)malloc(m5*n5*sizeof(double));
  for (row = 0; row < m6; row++)
    {
      for (col = 0; col < n6; col++)
	output2[row + col * m6] = pLen[col + row * n6];
    }

  cowavedec2 (input1, m1, n1, f1, f1+n3, f2, f2+n3,
	      n3, pLen, mr, total, input2[0], getdwtMode());

  cowavedec2 (input1, m1, n1, f1+n3*2, f1+n3*3, f2+n3*2, f2+n3*3,
	      n3, pLen, mi, total, input2[0], getdwtMode());

  copmd (mr,mi,total,pLen[0],pLen[1],output1_r,output1_i);


  free(pLen);
  free(f1);
  free(f2);
  free(mr);
  free(mi);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;

  return 0;
}


int
int_idualtree2D
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l1r, l1c;
   int minlhs=1, maxlhs=1, minrhs=4, maxrhs=4;
  int errCode, flow, it, val, *pLen, size, row, col, i;
  double *f1, *f2, *mr, *mi, *maxR, *maxI;
  double *input1_r,*input1_i;
  int *input2;
  double *input3;
  double *input4;
   double *output1;
   int readFlag;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  idualtree2D_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

  it = 1;

//   GetRhsCVar(1, "d", &it, &m1, &n1, &l1r, &l1c);
    readFlag = swt_gwsupport_GetComplexMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1_r,&input1_i);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(2, "i", &m2, &n2, &l2);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar(3, "d", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
//   GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

  if ((input2[0] < n3) || (input2[m2] < n3))
    {
      sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }
  size = 0;
  for (row = 1; row < (m2 - 1); row++)
    {
      size += (input2[row]) * (input2[row + m2]);
    }
  size = size * 3 + (input2[0]) * (input2[m2]);
  if (m1 * n1 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((input2[0] != input2[1]) ||
      (input2[m2] != input2[m2+1]))
    val += 1;
  for (row = 1; row < (m2 - 1); row++)
    {
      if (input2[row] >= input2[row + 1])
	val += 1;
      if (input2[row + m2] >= input2[row + m2 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }
  pLen = (int *)malloc (m2 * n2 * sizeof (int));
  for (row = 0; row < n2; row++)
    {
      for (col = 0; col < m2; col++)
	pLen[row + col * n2] = (int)input2[col + row * m2];
    }

  m5 = pLen[(m2 - 1) * n2];
  n5 = pLen[(m2 - 1) * n2 + 1];

//   CreateVar(5, "d", &m5, &n5, &l5);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  f1 = (double *)malloc(m3*n3*sizeof(double));
  f2 = (double *)malloc(m3*n3*sizeof(double));
  matrix_tran(input3,n3,m3,f1,m3,n3);
  matrix_tran(input4,n3,m3,f2,m3,n3);
  mr = (double *)malloc(m1*n1*sizeof(double));
  mi = (double *)malloc(m1*n1*sizeof(double));
  maxR = (double *)malloc(m5*n5*sizeof(double));
  maxI = (double *)malloc(m5*n5*sizeof(double));

  copmr (input1_r,input1_i,m1*n1,pLen[0],pLen[1],mr,mi);

  cowaverec2 (mr, m1*n1, f1, f1+n3, f2, f2+n3,
        n3, maxR, m5, n5, pLen, m2-2, getdwtMode());
  cowaverec2 (mi, m1*n1, f1+n3*2, f1+n3*3, f2+n3*2, f2+n3*3,
        n3, maxI, m5, n5, pLen, m2-2, getdwtMode());

  for(i=0;i<m5*n5;i++)
    output1[i] = (maxR[i]+maxI[i])/2;

  free(pLen);
  free(mr);
  free(mi);
  free(maxR);
  free(maxI);
  free(f1);
  free(f2);
  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;

  return 0;
}


int
int_cplxdual2D
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l6, m6, n6, l7, m7, n7, l8, m8, n8;
   int l5r, l5c, l7r, l7c;
   int minlhs=3, maxlhs=3, minrhs=4, maxrhs=4;
  int errCode, flow, calLen, temLen, count, ln, it, stride, val;
  int val1, val2, stride1, stride2, row, col, total, *pLen;
  double *f1, *f2, *mr, *mi, *mrr, *mii;
  int readFlag;
  double *input1;
  int *input2;
  double *input3;
  double *input4;
      double *output1_r,*output1_i;
      int *output2;
      double *output3_r,*output3_i;
      int i,j;
  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  dualtree2D_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

//   GetRhsVar(1, "d", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(2, "i", &m2, &n2, &l2);
    readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(3, "d", &m3, &n3, &l3);

    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsVar(4, "d", &m4, &n4, &l4);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }

  wave_len_validate ( m1, n3, &stride1, &val1);
  wave_len_validate ( n1, n3, &stride2, &val2);
  if ((val1 == 0) || (val2 == 0))
    {
      sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }
  stride = (stride1 > stride2) ? stride2 : stride1;
  if ((input2[0] < 1) || (input2[0] > stride))
    {
      sciprint ("Level Parameter is not valid for input matrix!\n");
      return 0;
    }
  pLen = malloc ((input2[0] + 2) * 2 * sizeof (int));
  matrix_wavedec_len_cal (m1, n1, input2[0], n3, pLen);
  wave_mem_cal (pLen, input2[0], &total);

  f1 = (double *)malloc(m3*n3*sizeof(double));
  f2 = (double *)malloc(m3*n3*sizeof(double));

  matrix_tran(input3,n3,m3,f1,m3,n3);
  matrix_tran(input4,n3,m3,f2,m3,n3);

  it = 1;
  m5 = 1;
  n5 = total;
  m6 = input2[0] + 2;
  n6 = 2;
  m7 = m5;
  n7 = n5;
//   CreateCVar (5, "d",&it, &m5, &n5, &l5r, &l5c);
readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1_r,&output1_i);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }
  readFlag = swt_gwsupport_AllocComplexMatrixOfDoubles (pvApiCtx, fname, 2,  m7 , n7 , &output3_r,&output3_i);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
//   CreateVar(6, "i", &m6, &n6, &l6);
readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  m6 , n6 , &output2);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }


  mr = (double *)malloc(m5*n5*sizeof(double));
  mi = (double *)malloc(m5*n5*sizeof(double));
//   CreateCVar(7, "d", &it, &m7, &n7, &l7r, &l7c);

  mrr = (double *)malloc(m5*n5*sizeof(double));
  mii = (double *)malloc(m5*n5*sizeof(double));
  for (row = 0; row < m6; row++)
    {
      for (col = 0; col < n6; col++)
	output2[row + col * m6] = (double)pLen[col + row * n6];
    }

  /* (1,1) */
  cowavedec2a (input1, m1, n1, f1, f1+n3, f1, f1+n3, f2, f2+n3,
	       f2, f2+n3, n3, pLen, mr, total, (int)input2[0], getdwtMode());
  /* (2,2) */
  cowavedec2a (input1, m1, n1, f1+n3*2, f1+n3*3, f1+n3*2, f1+n3*3,
	       f2+n3*2, f2+n3*3, f2+n3*2, f2+n3*3,
	       n3, pLen, mi, total,  (int)input2[0], getdwtMode());
  /* (1,2) */
  cowavedec2a (input1, m1, n1, f1, f1+n3, f1+n3*2, f1+n3*3,
	       f2, f2+n3, f2+n3*2, f2+n3*3, n3, pLen, mrr, total,
	       (int)input2[0], getdwtMode());
  /* (2,1) */
  cowavedec2a (input1, m1, n1, f1+n3*2, f1+n3*3, f1, f1+n3,
	       f2+n3*2, f2+n3*3, f2, f2+n3, n3, pLen, mii, total,
	       (int)input2[0], getdwtMode());


  copmd (mr,mi,total,pLen[0],pLen[1],output1_r,output1_i);

  copmd (mrr,mii,total,pLen[0],pLen[1],output3_r,output3_i);


  free(pLen);
  free(f1);
  free(f2);
  free(mr);
  free(mi);
  free(mrr);
  free(mii);

  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
  //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
  //AssignOutputVariable(pvApiCtx,3) = nbInputArgument(pvApiCtx) + 3;

  return 0;
}

int
int_icplxdual2D
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
   int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
   int l5, m5, n5, l1r, l1c, l6, m6, n6, l2r, l2c;
   int minlhs=1, maxlhs=1, minrhs=5, maxrhs=5;
  int errCode, flow, it, val, *pLen, size, row, col, i;
  double *f1, *f2, *mr, *mi, *maxR, *maxI, *mrr, *mii, *maxRR, *maxII;
  int readFlag;
  double *input1_r,*input1_i;
  double *input2_r,*input2_i;
  int *input3;
  double *input4;
    double *input5;
   double *output1;
  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  icplxdual2D_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }

  it = 1;

//   GetRhsCVar(1, "d", &it, &m1, &n1, &l1r, &l1c);
    readFlag = swt_gwsupport_GetComplexMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 ,  &input1_r,&input1_i);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
//   GetRhsCVar(2, "d", &it, &m2, &n2, &l2r, &l2c);
readFlag = swt_gwsupport_GetComplexMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2_r,&input2_i);
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

//   GetRhsVar(3, "i", &m3, &n3, &l3);
readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

//   GetRhsVar(4, "d", &m4, &n4, &l4);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

//   GetRhsVar(5, "d", &m5, &n5, &l5);
readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
if(readFlag==SWT_GWSUPPORT_ERROR)
  {
    return 0;
  }

  if ((input3[0] < n4) || (input3[m3] < n4))
    {
      sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
      return 0;
    }
  size = 0;
  for (row = 1; row < (m3 - 1); row++)
    {
      size += (input3[row]) * (input3[row + m3]);
    }
  size = size * 3 + (input3[0]) * (input3[m3]);
  if ((m1 * n1 != size) || (m2 * n2 != size))
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((input3[0] != input3[1]) ||
      (input3[m3] != input3[m3+1]))
    val += 1;
  for (row = 1; row < (m3 - 1); row++)
    {
      if (input3[row] >= input3[row + 1])
	val += 1;
      if (input3[row + m3] >= input3[row + m3 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }
  pLen = (int *)malloc (m3 * n3 * sizeof (int));
  for (row = 0; row < n3; row++)
    {
      for (col = 0; col < m3; col++)
	pLen[row + col * n3] = (int)input3[col + row * m3];
    }

  m6 = pLen[(m3 - 1) * n3];
  n6 = pLen[(m3 - 1) * n3 + 1];

//   CreateVar(6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  f1 = (double *)malloc(m4*n4*sizeof(double));
  f2 = (double *)malloc(m4*n4*sizeof(double));
  matrix_tran(input4,n4,m4,f1,m4,n4);
  matrix_tran(input5,n4,m4,f2,m4,n4);
  mr = (double *)malloc(m1*n1*sizeof(double));
  mi = (double *)malloc(m1*n1*sizeof(double));
  mrr = (double *)malloc(m1*n1*sizeof(double));
  mii = (double *)malloc(m1*n1*sizeof(double));
  maxR = (double *)malloc(m6*n6*sizeof(double));
  maxI = (double *)malloc(m6*n6*sizeof(double));
  maxRR = (double *)malloc(m6*n6*sizeof(double));
  maxII = (double *)malloc(m6*n6*sizeof(double));

  copmr (input1_r,input1_i,m1*n1,pLen[0],pLen[1],mr,mi);
  copmr (input2_r,input2_i,m1*n1,pLen[0],pLen[1],mrr,mii);

  /* (1,1) */
  cowaverec2a (mr, m1*n1, f1, f1+n4, f1, f1+n4,
	       f2, f2+n4, f2, f2+n4, n4, maxR,
	       m6, n6, pLen, m3-2, getdwtMode());
  /* (2,2) */
  cowaverec2a (mi, m1*n1, f1+n4*2, f1+n4*3,
	       f1+n4*2, f1+n4*3, f2+n4*2, f2+n4*3,
	       f2+n4*2, f2+n4*3, n4, maxI, m6, n6,
	       pLen, m3-2, getdwtMode());
  /* (1,2) */
  cowaverec2a (mrr, m1*n1, f1, f1+n4, f1+n4*2, f1+n4*3,
	       f2, f2+n4, f2+n4*2, f2+n4*3,
	       n4, maxRR, m6, n6, pLen, m3-2, getdwtMode());
  /* (2,2) */
  cowaverec2a (mii, m1*n1, f1+n4*2, f1+n4*3, f1, f1+n4,
	       f2+n4*2, f2+n4*3, f2, f2+n4,
	       n4, maxII, m6, n6, pLen, m3-2, getdwtMode());

  for(i=0;i<m6*n6;i++)
    output1[i] = (maxR[i]+maxI[i]+maxRR[i]+maxII[i])/4;

  free(pLen);
  free(mr);
  free(mi);
  free(mrr);
  free(mii);
  free(maxR);
  free(maxI);
  free(maxRR);
  free(maxII);
  free(f1);
  free(f2);
  //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;

  return 0;
}
