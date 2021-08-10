/*
 * -------------------------------------------------------------------------
 * dwt2d_int.c -- 2-D signal decomposition and reconstruction interface
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
// #include <stack-c.h>

int
int_dwt2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7, m8, n8;
  static int m9, n9;
  static int minrhs=2, maxrhs=5, minlhs=4, maxlhs=4;
  int errCode, flow, family, member, ii;
  int stride1, val1, stride2, val2;
  Func ana_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;
  double *output2=NULL;
  double *output3=NULL;
  double *output4=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  dwt2_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
    {
	  //sciprint("enter here!\n");
      validate_print (errCode);
      return 0;
    }



  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt2_content_validate (pvApiCtx, &errCode,flow,  input_string2,  NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( n1, pWaveStruct.length, &stride2, &val2);
      if ((val1 == 0) || (val2 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m3 = (int)floor((m1 + pWaveStruct.length - 1)/2);
      n3 = (int)floor((n1 + pWaveStruct.length - 1)/2);
	  if (getdwtMode()==PER)
	  {
		  m3 = (int)ceil(((double)m1)/2.0);
		  n3 = (int)ceil(((double)n1)/2.0);
	  }
      m4 = m3;
      n4 = n3;
      m5 = m3;
      n5 = n3;
      m6 = m3;
      n6 = n3;
      //CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m6 , n6 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt2D_neo (input1, m1, n1, output1, output2, output3,output4,
	     m3, n3, pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	     pWaveStruct.length, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 3;
      //AssignOutputVariable(pvApiCtx,2) = 4;
      //AssignOutputVariable(pvApiCtx,3) = 5;
      //AssignOutputVariable(pvApiCtx,4) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        dwt2_content_validate (pvApiCtx, &errCode,flow,  NULL,  NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m1<m2*n2) || (n1<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = (int)floor((m1 + m2*n2 - 1)/2);
      n4 = (int)floor((n1 + m2*n2 - 1)/2);
	  if (getdwtMode()==PER)
	  {
		  m4 = (int)ceil(((double)m1)/2.0);
		  n4 = (int)ceil(((double)n1)/2.0);
	  }
      m5 = m4;
      m6 = m4;
      m7 = m4;
      n5 = n4;
      n6 = n4;
      n7 = n4;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m5 , n5 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m6 , n6 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m7 , n7 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt2D_neo (input1, m1, n1, output1, output2, output3, output4,
	     m4, n4, input2, input3, m2*n2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      //AssignOutputVariable(pvApiCtx,3) = 6;
      //AssignOutputVariable(pvApiCtx,4) = 7;
      break;
    }
  case 3:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        dwt2_content_validate (pvApiCtx, &errCode,flow,  input_string2,  input_string3, input_string4, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( n1, pWaveStruct.length, &stride2, &val2);
      if ((val1 == 0) || (val2 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      //dwt_write(input_string4,&errCode);
      extend_method_parse (input_string4, &extMethod);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      m5 = (int)floor((m1 + pWaveStruct.length - 1)/2);
      n5 = (int)floor((n1 + pWaveStruct.length - 1)/2);
	  if (extMethod==PER)
	  {
		  m5 = (int)ceil(((double)m1)/2.0);
		  n5 = (int)ceil(((double)n1)/2.0);
	  }
      m6 = m5;
      m7 = m5;
      m8 = m5;
      n6 = n5;
      n7 = n5;
      n8 = n5;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m6 , n6 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m7 , n7 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(8, "d", &m8, &n8, &l8);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m8 , n8 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt2D_neo (input1, m1, n1,output1, output2, output3, output4,
	     m5, n5, pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	     pWaveStruct.length, extMethod);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      //AssignOutputVariable(pvApiCtx,3) = 7;
      //AssignOutputVariable(pvApiCtx,4) = 8;
      filter_clear();
      break;
    }
  case 4:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        dwt2_content_validate (pvApiCtx, &errCode,flow,  NULL,  NULL, input_string4, input_string5);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m1<m2*n2) || (n1<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      //dwt_write(input_string5,&errCode);
      extend_method_parse (input_string5, &extMethod);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      m6 = (int)floor((m1 + m2*n2 - 1)/2);
      n6 = (int)floor((n1 + m2*n2 - 1)/2);
	  if (extMethod==PER)
	  {
		  m6 = (int)ceil(((double)m1)/2.0);
		  n6 = (int)ceil(((double)n1)/2.0);
	  }
      m7 = m6;
      m8 = m6;
      m9 = m6;
      n7 = n6;
      n8 = n6;
      n9 = n6;
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m7 , n7 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(8, "d", &m8, &n8, &l8);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m8 , n8 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(9, "d", &m9, &n9, &l9);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m9 , n9 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt2D_neo (input1, m1, n1, output1, output2, output3, output4,
	     m6, n6, input2, input3, m2*n2, extMethod);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      //AssignOutputVariable(pvApiCtx,2) = 7;
      //AssignOutputVariable(pvApiCtx,3) = 8;
      //AssignOutputVariable(pvApiCtx,4) = 9;
      break;
    }
  default:
    break;
  }
  return 0;
}

int
int_idwt2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7, m8, n8;
  static int m9, n9, m10, n10;
  static int minrhs=5, maxrhs=9, minlhs=1, maxlhs=1;
  int errCode, flow, family, member, ii, stride, val1, val2;
  int m, n, count;
  double *ca, *ch, *cv, *cd, *vo;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  char *input_string7=NULL;
  char *input_string8=NULL;
  char *input_string9=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  idwt2_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  m = m1>0?m1:(m2>0?m2:(m3>0?m3:m4));
  n = n1>0?n1:(n2>0?n2:(n3>0?n3:n4));

  if (!m1 || !m2 || !m3 || !m4)
    {
      vo = malloc(m*n*sizeof(double));
      for(count=0;count<m*n;count++)
	vo[count] = 0;
    }
  if (!m1)
    ca = vo;
  else
    ca = input1;
  if (!m2)
    ch = vo;
  else
    ch = input2;
  if (!m3)
    cv = vo;
  else
    cv = input3;
  if (!m4)
    cd = vo;
  else
    cd = input4;

  switch (flow) {
  case 1:
    {
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string5,&family,&member);
      wavelet_fun_parser (input_string5, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( m, pWaveStruct.length, &stride, &val1);
      wave_len_validate ( n, pWaveStruct.length, &stride, &val2);
      if ((!val1) || (!val2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = m*2 - pWaveStruct.length + 2;
      n6 = n*2 - pWaveStruct.length + 2;
	  if (getdwtMode()==PER)
	  {
        m6 = 2*m;
		n6 = 2*n;
	  }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	    //  pWaveStruct.pHiPass, pWaveStruct.length,
	      //input6, m6, n6, getdwtMode());
	  idwt2D_neo (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      output1, m6, n6);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m<m5*n5) || (n<m5*n5))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m7 = m*2 - m5*n5 + 2;
      n7 = n*2 - m5*n5 + 2;
	  if (getdwtMode()==PER)
	  {
        m7 = 2*m;
		n7 = 2*n;
	  }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, input5, input6,
	    //  m5*n5, input7, m7, n7, getdwtMode());
	  idwt2D_neo (ca, ch, cv, cd, m, n, input5, input6,
	      m5*n5, output1, m7, n7);
      //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  case 3:
    {
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,6,  &m6, &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string5,&family,&member);
      wavelet_fun_parser (input_string5, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( m, pWaveStruct.length, &stride, &val1);
      wave_len_validate ( n, pWaveStruct.length, &stride, &val2);
      if ((!val1) || (!val2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      /*if ((int_input6[0]>(2*m-pWaveStruct.length+2)) ||
	  (int_input6[1]>(2*n-pWaveStruct.length+2)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}*/

	  if ((int_input6[0]>(2*m+pWaveStruct.length)) ||
	  (int_input6[1]>(2*n+pWaveStruct.length)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m7 = int_input6[0];
      n7 = int_input6[1];
	  //sciprint("m=%d\n",m7);
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	    //  pWaveStruct.pHiPass, pWaveStruct.length,
	      //input7, m7, n7, getdwtMode());
	  idwt2D_neo (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      output1, m7, n7);
      //AssignOutputVariable(pvApiCtx,1) = 7;
      filter_clear();
      break;
    }
  case 4:
    {
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "i", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,7,  &m7, &n7 , &int_input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m<m5*n5) || (n<m5*n5))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      /*if ((int_input7[0]>(2*m-m5*n5+2)) ||
	  (int_input7[1]>(2*n-m5*n5+2)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}*/

	  if ((int_input7[0]>(2*m+m5*n5)) ||
	  (int_input7[1]>(2*n+m5*n5)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m8 = int_input7[0];
      n8 = int_input7[1];
      //CreateVar(8, "d", &m8, &n8, &l8);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m8 , n8 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, input5, input6,
	    //  m5*n5, input8, m8, n8, getdwtMode());
	  idwt2D_neo (ca, ch, cv, cd, m, n, input5, input6,
	      m5*n5, output1, m8, n8);
      //AssignOutputVariable(pvApiCtx,1) = 8;
      break;
    }
  case 5:
    {
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "c", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 6 , &input_string6 );
      m6=1;n6=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "c", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 7 , &input_string7 );
      m7=1;n7=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string5,&family,&member);
      wavelet_fun_parser (input_string5, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( m, pWaveStruct.length, &stride, &val1);
      wave_len_validate ( n, pWaveStruct.length, &stride, &val2);
      if ((!val1) || (!val2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string7, &extMethod);
      m8 = m*2 - pWaveStruct.length + 2;
      n8 = n*2 - pWaveStruct.length + 2;
	  if (extMethod==PER)
	  {
        m8 = 2*m;
		n8 = 2*n;
	  }
      //CreateVar(8, "d", &m8, &n8, &l8);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m8 , n8 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	    //  pWaveStruct.pHiPass, pWaveStruct.length,
	      //input8, m8, n8, extMethod);
	  idwt2D_neo (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      output1, m8, n8);
      //AssignOutputVariable(pvApiCtx,1) = 8;
      filter_clear();
      break;
    }
  case 6:
    {
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "c", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 7 , &input_string7 );
      m7=1;n7=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(8, "c", &m8, &n8, &l8);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 8 , &input_string8 );
      m8=1;n8=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m<m5*n5) || (n<m5*n5))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string8, &extMethod);
      m9 = m*2 - m5*n5 + 2;
      n9 = n*2 - m5*n5 + 2;
	  if (extMethod==PER)
	  {
        m9 = 2*m;
		n9 = 2*n;
	  }
      //CreateVar(9, "d", &m9, &n9, &l9);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m9 , n9 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, input5, input6,
	    //  m5*n5, input9, m9, n9, extMethod);
	  idwt2D_neo (ca, ch, cv, cd, m, n, input5, input6,
	      m5*n5, output1, m9, n9);
      //AssignOutputVariable(pvApiCtx,1) = 9;
      break;
    }
  case 7:
    {
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,6,  &m6, &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "c", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 7 , &input_string7 );
      m7=1;n7=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(8, "c", &m8, &n8, &l8);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 8 , &input_string8 );
      m8=1;n8=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string5,&family,&member);
      wavelet_fun_parser (input_string5, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( m, pWaveStruct.length, &stride, &val1);
      wave_len_validate ( n, pWaveStruct.length, &stride, &val2);
      if ((!val1) || (!val2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      /*if ((int_input6[0]>(2*m-pWaveStruct.length+2)) ||
	  (int_input6[1]>(2*n-pWaveStruct.length+2)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}*/

	  if ((int_input6[0]>(2*m+pWaveStruct.length)) ||
	  (int_input6[1]>(2*n+pWaveStruct.length)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      extend_method_parse (input_string8, &extMethod);
      m9 = int_input6[0];
      n9 = int_input6[1];
      //CreateVar(9, "d", &m9, &n9, &l9);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m9 , n9 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	    //  pWaveStruct.pHiPass, pWaveStruct.length,
	      //input9, m9, n9, extMethod);
	  idwt2D_neo (ca, ch, cv, cd, m, n, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      output1, m9, n9);//, extMethod);
      //AssignOutputVariable(pvApiCtx,1) = 9;
      filter_clear();
      break;
    }
  case 8:
    {
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "i", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,7,  &m7, &n7 , &int_input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(8, "c", &m8, &n8, &l8);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 8 , &input_string8 );
      m8=1;n8=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      //GetRhsVar(9, "c", &m9, &n9, &l9);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 9 , &input_string9 );
      m9=1;n9=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt2_content_validate (pvApiCtx, &errCode,flow,input_string5,int_input6,input_string6,int_input7,input_string7,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((m<m5*n5) || (n<m5*n5))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      /*if ((int_input7[0]>(2*m-m5*n5+2)) ||
	  (int_input7[1]>(2*n-m5*n5+2)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}*/

	  if ((int_input7[0]>(2*m+m5*n5)) ||
	  (int_input7[1]>(2*n+m5*n5)))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      extend_method_parse (input_string9, &extMethod);
      m10 = int_input7[0];
      n10 = int_input7[1];
      //CreateVar(10, "d", &m10, &n10, &l10);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m10 , n10 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //idwt2D (ca, ch, cv, cd, m, n, input5, input6,
	    //  m5*n5, input10, m10, n10, extMethod);
	  idwt2D_neo (ca, ch, cv, cd, m, n, input5, input6,
	      m5*n5, output1, m10, n10);
      //AssignOutputVariable(pvApiCtx,1) = 10;
      break;
    }
  default:
    break;
  }

  //sciprint("flow = %d\n",flow);
  return 0;
}

int
int_wavedec2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6;
  static int minrhs=3, maxrhs=4, minlhs=2, maxlhs=2;
  int errCode, flow, family, member, ii, row, col, total, *pLen;
  int stride1, val1, stride2, val2, stride;
  Func ana_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;
  int *int_output2=NULL;
  double *output3=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  //if (getdwtMode()==PER)
  //{
  // sciprint("PER extension mode is not supported for multiple level decomposition!\n");
  //	sciprint("Please change the extension mode by dwtmode command.\n");
  //	return 0;
  //}

  wavedec2_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }



  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wavedec2_content_validate (pvApiCtx, &errCode,flow,int_input2,input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( n1, pWaveStruct.length, &stride2, &val2);
      if ((val1 == 0) || (val2 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      stride = (stride1 > stride2) ? stride2 : stride1;
      if ((int_input2[0] < 1) || (int_input2[0] > stride))
	{
	  sciprint ("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}

      pLen = malloc ((int_input2[0] + 2) * 2 * sizeof (int));
      matrix_wavedec_len_cal (m1, n1, int_input2[0],
			      pWaveStruct.length, pLen);
      //for(row=0;row<(int_input2[0]+2)*2;row++)
       //sciprint("%d\n",pLen[row]);

      wave_mem_cal (pLen, int_input2[0], &total);
      m4 = 1;
      n4 = total;
      m5 = int_input2[0] + 2;
      n5 = 2;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m5 , n5 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      for (row = 0; row < m5; row++)
	{
	  for (col = 0; col < n5; col++)
	    int_output2[row + col * m5] = pLen[col + row * n5];
	}
      wavedec2 (input1, m1, n1, pWaveStruct.pLowPass,
		pWaveStruct.pHiPass, pWaveStruct.length,
		pLen, output1, m4*n4, int_input2[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      filter_clear();
      free(pLen);
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
    wavedec2_content_validate (pvApiCtx, &errCode,flow,int_input2,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( m1, m3*n3, &stride1, &val1);
      wave_len_validate ( n1, m3*n3, &stride2, &val2);
      if ((val1 == 0) || (val2 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      stride = (stride1 > stride2) ? stride2 : stride1;
      if ((int_input2[0] < 1) || (int_input2[0] > stride))
	{
	  sciprint ("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
      pLen = malloc ((int_input2[0] + 2) * 2 * sizeof (int));
      matrix_wavedec_len_cal (m1, n1, int_input2[0], m3*n3, pLen);
      wave_mem_cal (pLen, int_input2[0], &total);
      m5 = 1;
      n5 = total;
      m6 = int_input2[0] + 2;
      n6 = 2;
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      for (row = 0; row < m6; row++)
	{
	  for (col = 0; col < n6; col++)
	    int_output2[row + col * m6] = pLen[col + row * n6];
	}
      wavedec2 (input1, m1, n1, input3, input4, m3*n3,
		pLen, output1, m5*n5, int_input2[0], getdwtMode());
      //LhsVar (1) = 5;
      //LhsVar (2) = 6;
      free(pLen);
      break;
    }
  default:
    break;
  }
  return 0;
}

int
int_waverec2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5;
  static int minrhs=3, maxrhs=4, minlhs=1, maxlhs=1;
  int errCode, flow, family, member, ii, val, row, col, size, *pLen;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  waverec2_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec2_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input2[0] < pWaveStruct.length) ||
	  (int_input2[m2] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      size = 0;
      for (row = 1; row < (m2 - 1); row++)
	{
	  size += (int_input2[row]) * (int_input2[row + m2]);
	}
      size = size * 3 + (int_input2[0]) * (int_input2[m2]);
      if (m1 * n1 != size)
	{
	  sciprint ("Inputs are not size array and coefs!\n");
	  return 0;
	}
      val = 0;
      if ((int_input2[0] != int_input2[1]) ||
	  (int_input2[m2] != int_input2[m2+1]))
	val += 1;
      for (row = 1; row < (m2 - 1); row++)
	{
	  if (int_input2[row] >= int_input2[row + 1])
	    val += 1;
	  if (int_input2[row + m2] >= int_input2[row + m2 + 1])
	    val += 1;
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not size array!\n");
	  return 0;
	}
      pLen = malloc (m2 * n2 * sizeof (int));
      for (row = 0; row < n2; row++)
	{
	  for (col = 0; col < m2; col++)
	    pLen[row + col * n2] = int_input2[col + row * m2];
	}
      m4 = pLen[(m2 - 1) * n2];
      n4 = pLen[(m2 - 1) * n2 + 1];
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec2 (input1, m1*n1, pWaveStruct.pLowPass,
		pWaveStruct.pHiPass, pWaveStruct.length,
		output1, m4, n4, pLen, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      free(pLen);
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      waverec2_content_validate (pvApiCtx, &errCode, flow, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0] < m3*n3) ||
	  (int_input2[m2] < m3*n3))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      size = 0;
      for (row = 1; row < (m2 - 1); row++)
	{
	  size += (int_input2[row]) * (int_input2[row + m2]);
	}
      size = size * 3 + (int_input2[0]) * (int_input2[m2]);
      if (m1 * n1 != size)
	{
	  sciprint ("Inputs are not size array and coefs!\n");
	  return 0;
	}
      val = 0;
      if ((int_input2[0] != int_input2[1]) ||
	  (int_input2[m2] != int_input2[m2+1]))
	val += 1;
      for (row = 1; row < (m2 - 1); row++)
	{
	  if (int_input2[row] >= int_input2[row + 1])
	    val += 1;
	  if (int_input2[row + m2] >= int_input2[row + m2 + 1])
	    val += 1;
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not size array!\n");
	  return 0;
	}
      pLen = malloc (m2 * n2 * sizeof (int));
      for (row = 0; row < n2; row++)
	{
	  for (col = 0; col < m2; col++)
	    pLen[row + col * n2] = int_input2[col + row * m2];
	}
      m5 = pLen[(m2 - 1) * n2];
      n5 = pLen[(m2 - 1) * n2 + 1];
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec2 (input1, m1*n1, input3, input4,
		m3*n3, output1, m5, n5, pLen, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      free(pLen);
      break;
    }
  default:
    break;
  }

  return 0;
}

int
int_wenergy2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6;
  static int minrhs=2, maxrhs=2, minlhs=2, maxlhs=4;
  int errCode, flow, size, val, row, col, *pLen;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;
  double *output2=NULL;
  double *output3=NULL;
  double *output4=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  wenergy2_form_validate (pvApiCtx, &errCode,&flow, Rhs, Lhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  size = 0;
  for (row = 1; row < (m2 - 1); row++)
    {
      size += (int_input2[row]) * (int_input2[row + m2]);
    }
  size = size * 3 + (int_input2[0]) * (int_input2[m2]);
  if (m1 * n1 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((int_input2[0] != int_input2[1]) ||
      (int_input2[m2] != int_input2[m2+1]))
    val += 1;
  for (row = 1; row < (m2 - 1); row++)
    {
      if (int_input2[row] >= int_input2[row + 1])
	val += 1;
      if (int_input2[row + m2] >= int_input2[row + m2 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }
  pLen = malloc (m2 * n2 * sizeof (int));
  for (row = 0; row < n2; row++)
    {
      for (col = 0; col < m2; col++)
	pLen[row + col * n2] = int_input2[col + row * m2];
    }

  switch (flow) {
  case 1:
    {
      m3 = 1;
      m4 = 1;
      m5 = 1;
      m6 = 1;
      n3 = 1;
      n4 = m2 - 2;
      n5 = m2 - 2;
      n6 = m2 - 2;
      //CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m5 , n5 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 4,  m6 , n6 , &output4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wenergy_4output (input1, m1*n1, pLen, output1, output2,
      output3, output4, n4, m2 - 2);
      //AssignOutputVariable(pvApiCtx,1) = 3;
      //AssignOutputVariable(pvApiCtx,2) = 4;
      //AssignOutputVariable(pvApiCtx,3) = 5;
      //AssignOutputVariable(pvApiCtx,4) = 6;
      break;
    }
  case 2:
    {
      m3 = 1;
      n3 = 1;
      m4 = 1;
      n4 = m2 - 2;
      //CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wenergy_2output (input1, m1*n1, pLen, output1, output2,
		      n4, m2-2);
      //AssignOutputVariable(pvApiCtx,1) = 3;
      //AssignOutputVariable(pvApiCtx,2) = 4;
      break;
    }
  default:
    break;
  }
  free(pLen);
  return 0;
}

int
int_detcoef2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7;
  static int minrhs=4, maxrhs=4, minlhs=1, maxlhs=3;
  int errCode, flow, row, size, val, *pLen, col;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;
  double *output2=NULL;
  double *output3=NULL;
  double *output4=NULL;
  static char h[] = { "h" };
  static char v[] = { "v" };
  static char d[] = { "d" };

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  detcoef2_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar(1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(3, "i", &m3, &n3, &l3);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,3,  &m3, &n3 , &int_input3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar(4, "i", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,4,  &m4, &n4 , &int_input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }


  detcoef2_content_validate (pvApiCtx, &errCode,flow,input_string1);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  size = 0;
  for (row = 1; row < (m3 - 1); row++)
    {
      size += (int_input3[row]) * (int_input3[row + m3]);
    }
  size = size * 3 + (int_input3[0]) * (int_input3[m3]);
  if (m2 * n2 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((int_input3[0] != int_input3[1]) ||
      (int_input3[m3] != int_input3[m3+1]))
    val += 1;
  for (row = 1; row < (m3 - 1); row++)
    {
      if (int_input3[row] >= int_input3[row + 1])
	val += 1;
      if (int_input3[row + m3] >= int_input3[row + m3 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }
  if ((int_input4[0]<=0) || (int_input4[0]>(m3-2)))
    {
      sciprint ("Level Parameter is not valid for input matrix!\n");
      return 0;
    }


  pLen = malloc (m3 * n3 * sizeof (int));
  for (row = 0; row < n3; row++)
    {
      for (col = 0; col < m3; col++)
	pLen[row + col * n3] = int_input3[col + row * m3];
    }

  if ((Lhs==1) && (!strcmp(input_string1,"h")))
    {
      m5 = pLen[(m3 - 1 - int_input4[0]) * n3];
      n5 = pLen[(m3 - 1 - int_input4[0]) * n3 + 1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      detcoef2 (input2, m2*n2 , output1, m5*n5, pLen, m3-2,
		int_input4[0], input_string1);
      //AssignOutputVariable(pvApiCtx,1) = 5;
    }
  else if ((Lhs==1) && (!strcmp(input_string1,"v")))
    {
      m5 = pLen[(m3 - 1 - int_input4[0]) * n3];
      n5 = pLen[(m3 - 1 - int_input4[0]) * n3 + 1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      detcoef2 (input2, m2*n2 , output1, m5*n5, pLen, m3-2,
		int_input4[0], input_string1);
      //AssignOutputVariable(pvApiCtx,1) = 5;
    }
  else if ((Lhs==1) && (!strcmp(input_string1,"d")))
    {
      m5 = pLen[(m3 - 1 - int_input4[0]) * n3];
      n5 = pLen[(m3 - 1 - int_input4[0]) * n3 + 1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      detcoef2 (input2, m2*n2 , output1, m5*n5, pLen, m3-2,
		int_input4[0], input_string1);
    //AssignOutputVariable(pvApiCtx,1) = 5;
    }
  else if ((Lhs==1) && ((!strcmp(input_string1,"c")) ||
			(!strcmp(input_string1,"compact"))))
    {
      m5 = pLen[(m3 - 1 - int_input4[0]) * n3];
      n5 = pLen[(m3 - 1 - int_input4[0]) * n3 + 1]*3;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      detcoef2 (input2, m2*n2 , output1, m5*n5/3, pLen, m3-2,
		int_input4[0], h);
      detcoef2 (input2, m2*n2 , output1+m5*n5/3, m5*n5/3, pLen,
		m3-2, int_input4[0], v);
      detcoef2 (input2, m2*n2 , output1+m5*n5*2/3, m5*n5/3, pLen, m3-2,
		int_input4[0], d);
      //AssignOutputVariable(pvApiCtx,1) = 5;
    }

  else if ((Lhs==3) && ((!strcmp(input_string1,"a")) ||
			(!strcmp(input_string1,"all"))))
    {
      m5 = pLen[(m3 - 1 - int_input4[0]) * n3];
      n5 = pLen[(m3 - 1 - int_input4[0]) * n3 + 1];
      m6 = m5;
      m7 = m5;
      n6 = n5;
      n7 = n5;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m6 , n6 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m7 , n7 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      detcoef2 (input2, m2*n2 , output1, m5*n5, pLen, m3-2,
		int_input4[0], h);
      detcoef2 (input2, m2*n2 , output2, m6*n6, pLen, m3-2,
		int_input4[0], v);
      detcoef2 (input2, m2*n2 , output3, m7*n7, pLen, m3-2,
		int_input4[0], d);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      //AssignOutputVariable(pvApiCtx,3) = 7;
    }
  else
    {
      sciprint("Unknown Input Error!\n");
      return 0;
    }
  free(pLen);
  return 0;
}


int
int_appcoef2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6;
  static int minrhs=3, maxrhs=5, minlhs=1, maxlhs=1;
  int errCode, flow, size, row, val, *pLen, family, member, ii, col;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  appcoef2_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  //sciprint("after form check!\n");
  //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  size = 0;
  for (row = 1; row < (m2 - 1); row++)
    {
      size += (int_input2[row]) * (int_input2[row + m2]);
    }
  size = size * 3 + (int_input2[0]) * (int_input2[m2]);
  if (m1 * n1 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((int_input2[0] != int_input2[1]) ||
      (int_input2[m2] != int_input2[m2+1]))
    val += 1;
  for (row = 1; row < (m2 - 1); row++)
    {
      if (int_input2[row] >= int_input2[row + 1])
	val += 1;
      if (int_input2[row + m2] >= int_input2[row + m2 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }

  pLen = malloc (m2 * n2 * sizeof (int));
  for (row = 0; row < n2; row++)
    {
      for (col = 0; col < m2; col++)
	pLen[row + col * n2] = int_input2[col + row * m2];
    }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,4,  &m4, &n4 , &int_input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      appcoef2_content_validate (pvApiCtx, &errCode, flow, input_string3,int_input4,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //sciprint("after content check!\n");
      if (int_input4[0]>m2-2)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input2[0] < pWaveStruct.length) ||
	  (int_input2[m2] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = pLen[(m2 - 1 - int_input4[0]) * n2];
      n5 = pLen[(m2 - 1 - int_input4[0]) * n2 + 1];
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2 (input1, m1*n1, pWaveStruct.pLowPass,
		pWaveStruct.pHiPass, pWaveStruct.length,
		output1, m5, n5, pLen, m2-2, int_input4[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2_content_validate (pvApiCtx, &errCode, flow,input_string3,NULL,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input2[0] < pWaveStruct.length) ||
	  (int_input2[m2] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = pLen[0];
      n4 = pLen[1];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2 (input1, m1*n1, pWaveStruct.pLowPass,
		pWaveStruct.pHiPass, pWaveStruct.length,
		output1, m4, n4, pLen, m2-2, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 3:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      appcoef2_content_validate (pvApiCtx, &errCode, flow, NULL,NULL,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0] < m3*n3) ||
	  (int_input2[m2] < m3*n3))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = pLen[0];
      n5 = pLen[1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2 (input1, m1*n1, input3, input4, m3*n3,
		output1, m5, n5, pLen, m2-2, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  case 4:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2_content_validate (pvApiCtx, &errCode, flow, NULL,NULL,int_input5);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0] < m3*n3) ||
	  (int_input2[m2] < m3*n3))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      if (int_input5[0]>m2-2)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m6 = pLen[(m2 - 1 - int_input5[0]) * n2];
      n6 = pLen[(m2 - 1 - int_input5[0]) * n2 + 1];
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef2 (input1, m1*n1, input3, input4, m3*n3,
	      output1, m6, n6, pLen, m2-2, int_input5[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  default:
    break;
  }
  free(pLen);
  return 0;
}


int
int_wrcoef2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7;
  static int minrhs=4, maxrhs=6, minlhs=1, maxlhs=1;
  int errCode, flow, size, row, val, *pLen, family, member, ii, col;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;

  wrcoef2_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  //GetRhsVar(1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(3, "i", &m3, &n3, &l3);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,3,  &m3, &n3 , &int_input3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  size = 0;
  for (row = 1; row < (m3 - 1); row++)
    {
      size += (int_input3[row]) * (int_input3[row + m3]);
    }
  size = size * 3 + (int_input3[0]) * (int_input3[m3]);
  if (m2 * n2 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((int_input3[0] != int_input3[1]) ||
      (int_input3[m3] != int_input3[m3+1]))
    val += 1;
  for (row = 1; row < (m3 - 1); row++)
    {
      if (int_input3[row] >= int_input3[row + 1])
	val += 1;
      if (int_input3[row + m3] >= int_input3[row + m3 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }

  pLen = malloc (m3 * n3 * sizeof (int));
  for (row = 0; row < n3; row++)
    {
      for (col = 0; col < m3; col++)
	pLen[row + col * n3] = int_input3[col + row * m3];
    }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef2_content_validate (pvApiCtx, &errCode,flow,input_string1,input_string4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input3[0] < pWaveStruct.length) ||
	  (int_input3[m3] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      if ((int_input5[0]<=0) || (int_input5[0]>(m3-2)))
	{
	  sciprint ("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m6 = pLen[(m3 - 1) * n3];
      n6 = pLen[(m3 - 1) * n3 + 1];
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef2 (input2, m2*n2, pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass, pWaveStruct.length,
	       output1, m6, n6, pLen, m3-2, int_input5[0],
	       input_string1, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,6,  &m6, &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wrcoef2_content_validate (pvApiCtx, &errCode,flow,input_string1,input_string4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input6[0]<=0) || (int_input6[0]>(m3-2)))
	{
	  sciprint ("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
      if ((int_input3[0] < m4*n4) ||
	  (int_input3[m3] < m4*n4))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m7 = pLen[(m3 - 1) * n3];
      n7 = pLen[(m3 - 1) * n3 + 1];
      //CreateVar (7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef2 (input2, m2*n2, input4, input5,
	       m4*n4, output1, m7, n7, pLen, m3-2, int_input6[0],
	       input_string1, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  case 3:
    {
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wrcoef2_content_validate (pvApiCtx, &errCode,flow,input_string1,input_string4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input3[0] < pWaveStruct.length) ||
	  (int_input3[m3] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = pLen[(m3 - 1) * n3];
      n5 = pLen[(m3 - 1) * n3 + 1];
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef2 (input2, m2*n2, pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass, pWaveStruct.length,
	       output1, m5, n5, pLen, m3-2, m3-2,
	       input_string1, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 4:
    {
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wrcoef2_content_validate (pvApiCtx, &errCode,flow,input_string1,input_string4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input3[0] < m4*n4) ||
	  (int_input3[m3] < m4*n4))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = pLen[(m3 - 1) * n3];
      n6 = pLen[(m3 - 1) * n3 + 1];
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef2 (input2, m2*n2, input4, input5,
	       m4*n4, output1, m6, n6, pLen, m3-2, m3-2,
	       input_string1, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  default:
    break;
  }
  free(pLen);
  return 0;
}


int
int_upwlev2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7;
  static int minrhs=3, maxrhs=4, minlhs=3, maxlhs=3;
  int errCode, flow, size, row, val, *pLen, family, member, ii, col;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;
  int *int_output2=NULL;
  double *output3=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  upwlev2_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

  size = 0;
  for (row = 1; row < (m2 - 1); row++)
    {
      size += (int_input2[row]) * (int_input2[row + m2]);
    }
  size = size * 3 + (int_input2[0]) * (int_input2[m2]);
  if (m1 * n1 != size)
    {
      sciprint ("Inputs are not size array and coefs!\n");
      return 0;
    }
  val = 0;
  if ((int_input2[0] != int_input2[1]) ||
      (int_input2[m2] != int_input2[m2+1]))
    val += 1;
  for (row = 1; row < (m2 - 1); row++)
    {
      if (int_input2[row] >= int_input2[row + 1])
	val += 1;
      if (int_input2[row + m2] >= int_input2[row + m2 + 1])
	val += 1;
    }
  if (val != 0)
    {
      sciprint ("Inputs are not size array!\n");
      return 0;
    }

  pLen = malloc (m2 * n2 * sizeof (int));
  for (row = 0; row < n2; row++)
    {
      for (col = 0; col < m2; col++)
	pLen[row + col * n2] = int_input2[col + row * m2];
    }

  if (m2<=3)
    {
      sciprint("Inputs are not coef and length!\n");
      return 0;
    }

  if (m2<4)
  {
	  sciprint("Decomposition level less than 2 is not accepted!\n");
      return 0;
  }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev2_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if ((int_input2[0] < pWaveStruct.length) ||
	  (int_input2[m2] < pWaveStruct.length))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      m4 = 1;
      m5 = m2 - 1;
      n4 = n1*m1 - 4*pLen[0]*pLen[1] + pLen[4]*pLen[5];
      n5 = 2;
      m6 = pLen[0];
      n6 = pLen[1];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m5 , n5 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m6 , n6 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev2 (input1, m1*n1, pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass,pWaveStruct.length,
	       pLen, m2, n2, output3, m6*n6, output1, m4*n4,
         int_output2, m5, n5, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      //AssignOutputVariable(pvApiCtx,3) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      upwlev2_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0] < m3*n3) ||
	  (int_input2[m2] < m3*n3))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      m6 = m2 - 1;
      n5 = n1*m1 - 4*pLen[0]*pLen[1] + pLen[4]*pLen[5];
      n6 = 2;
      m7 = pLen[0];
      n7 = pLen[1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m7 , n7 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev2 (input1, m1*n1, input3, input4, m3*n3,
	       pLen, m2, n2, output3, m7*n7, output1, m5*n5,
         int_output2, m6, n6, m2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      //AssignOutputVariable(pvApiCtx,3) = 7;
      break;
    }
  default:
    break;
  }
  free(pLen);
  return 0;
}


int
int_upcoef2 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7;
  static int minrhs=3, maxrhs=6, minlhs=1, maxlhs=1;
  int errCode, flow, s2, s3, s4, s1, family, member, ii;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  double *output1=NULL;


  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  upcoef2_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  //GetRhsVar(1, "c", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
  m1=1;n1=1;
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
    //GetR
  //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx,fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,4,  &m4, &n4 , &int_input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input4[0]<1)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
//       if ((m2<pWaveStruct.length) || (n2<pWaveStruct.length))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}
      upcoef_len_cal (m2, pWaveStruct.length, int_input4[0],
		      &s1, &s2);
      upcoef_len_cal (n2, pWaveStruct.length, int_input4[0],
		      &s3, &s4);
      if ((int_input5[0]>s1) || (int_input5[1]>s3))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m6 = int_input5[0];
      n6 = int_input5[1];
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass, pWaveStruct.length,
	       output1, m6, n6, s1, s3, int_input4[0], input_string1);//,
	       //getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,6,  &m6, &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (int_input5[0]<1)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
//       if ((m2<m3*n3) || (n2<m3*n3))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}
      upcoef_len_cal (m2, m3*n3, int_input5[0], &s1, &s2);
      upcoef_len_cal (n2, m3*n3, int_input5[0], &s3, &s4);
      if ((int_input6[0]>s1) || (int_input6[1]>s3))
	{
	  sciprint("Size Parameter is not valid for input matrix!\n");
	  return 0;
	}
      m7 = int_input6[0];
      n7 = int_input6[1];
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	input3, input4, m3*n3,
	       output1, m7, n7, s1, s3, int_input5[0], input_string1);//,
	       //getdwtMode());
    //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  case 3:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,4,  &m4, &n4 , &int_input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input4[0]<1)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
//       if ((m2<pWaveStruct.length) || (n2<pWaveStruct.length))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}
	  //sciprint("before upcoef_len_cal!\n");
      upcoef_len_cal (m2, pWaveStruct.length, int_input4[0],
		      &s1, &s2);
      upcoef_len_cal (n2, pWaveStruct.length, int_input4[0],
		      &s3, &s4);
      m5 = s1;
      n5 = s3;
	  //sciprint("after upcoef_len_cal!\n");
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass, pWaveStruct.length,
	       output1, m5, n5, s1, s3, int_input4[0], input_string1);//,
	       //getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 4:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (int_input5[0]<1)
	{
	  sciprint("Level Parameter is not valid for input matrix!\n");
	  return 0;
	}
//       if ((m2<m3*n3) || (n2<m3*n3))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}
      upcoef_len_cal (m2, m3*n3, int_input5[0], &s1, &s2);
      upcoef_len_cal (n2, m3*n3, int_input5[0], &s3, &s4);
      m6 = s1;
      n6 = s3;
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	input3, input4, m3*n3,
	       output1, m6, n6, s1, s3, int_input5[0], input_string1);//,
	       //getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  case 5:
    {
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
//       if ((m2<pWaveStruct.length) || (n2<pWaveStruct.length))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}

       upcoef_len_cal (m2, pWaveStruct.length, 1, &s1, &s2);
      upcoef_len_cal (n2, pWaveStruct.length, 1, &s3, &s4);
      	//printf("m2 %d, pwave %d, s1 %d s2 %d\n",m2,pWaveStruct.length,s1,s2);
	//printf("n2 %d, pwave %d, s3 %d s4 %d\n",n2,pWaveStruct.length,s3,s4);
      m4 = s1;
      n4 = s3;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	pWaveStruct.pLowPass,
	       pWaveStruct.pHiPass, pWaveStruct.length,
	       output1, m4, n4, s1, s3, 1, input_string1);//,
	       //getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 6:
    {
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      upcoef2_content_validate (pvApiCtx, &errCode, flow,input_string1,input_string3,int_input4,int_input5,int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
//       if ((m2<m3*n3) || (n2<m3*n3))
// 	{
// 	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
// 	  return 0;
// 	}
      upcoef_len_cal (m2, m3*n3, 1, &s1, &s2);
      upcoef_len_cal (n2, m3*n3, 1, &s3, &s4);
      m5 = s1;
      n5 = s3;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef2 (input2, m2, n2,	input3, input4, m3*n3,
	       output1, m5, n5, s1, s3, 1, input_string1);//,
	       //getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  default:
    break;
  }

  return 0;
}
